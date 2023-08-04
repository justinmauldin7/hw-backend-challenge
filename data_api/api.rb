require 'pry'
require 'csv'

require 'roda'
require 'rom-sql'

require_relative 'repositories/clients'
require_relative 'repositories/carriers'
require_relative 'repositories/policies'

require_relative 'services/gpg_engine'
require_relative 'services/file_decryptor'

class API < Roda
  plugin :json
  plugin :typecast_params

  container = ROM.container(:sql, "sqlite://../data/database.db") do |conf|
    conf.register_relation(Clients)
    conf.register_relation(Carriers)
    conf.register_relation(Policies)
  end

  MAX_RANGE = 1000

  def limit_range(count)
    (count > MAX_RANGE) ? MAX_RANGE : count
  end

  route do |r|
    client_repo = ClientRepository.new(container)
    carrier_repo = CarrierRepository.new(container)
    policy_repo = PolicyRepository.new(container)

    r.on "summary" do
      r.is do
        r.get do
          {
            policies: policy_repo.count,
            carriers: carrier_repo.count,
            clients: client_repo.count
          }
        end
      end
    end
    
    r.on "client_upload" do
      r.is do
        r.post do
          encrypted_file_content = request.body.read
 
          # TODO figure out a way to get the GPG Engine to work since it is cleaner than the Tempfile method of decryption
          # decrypted_file_content = GPG.decrypt(encrypted_file_content).read
          
          decrypted_file_content = FileDecryptor.execute(encrypted_file_content)
          decrypted_csv = CSV.parse(decrypted_file_content, :headers => true)


          # TODO Break this "update" client code out into a new module or something so this route is single responsibility & not so fat.
          decrypted_csv.each do | row_data |
            id = row_data.first[1]
            client = client_repo.find(id)

            if client.count == 0
              client.changeset(:create, id: id).commit
            end

            # TODO figure out a way to pass multiple update params at once, like you can in ActiveRecord's update or create methods.
            # That way we don't have to make an update call on each field of data that comes from the CSV file.
            row_data.each do | update_pair |
              update_hash = {}
              update_hash[update_pair[0]] = update_pair[1]

              # TODO figure out a way to get a custom "update" method on the ClientRepository.
              # client.update(update_hash)

              # FIX the other data fields for a client is not updating after it doesn't exist yet,
              # and we create the new record on line 63.  All fields, but the ID are currently showing "null".

              # FIX also, it looks like existing records with changes to them are not persisting their changes when you access them
              # even though when you pry in, after the changset commit, you see they are changed.

              client.changeset(:update, update_hash).commit
            end
          end
          
          # TODO I am sure we are going to want to return something different than this after the file upload.
          {
            success: "Records successfully imported."
          }
        end
      end
    end


    r.on "clients" do
      r.on Integer do |id|
        client = client_repo.find(id)

        r.is "policies" do
          enriched_client = client.with_policies.one
          policies = enriched_client.policies.map(&:to_h)

          {
            count: policies.count,
            client: enriched_client.to_h
          }
        end

        r.get do
          client.one!.to_h
        end
      end

      r.is do
        r.get do
          count = limit_range(typecast_params.pos_int('count', 50))
          page = typecast_params.pos_int('p', 0)

          objects = client_repo.get_paged(count: count, page: page).map(&:to_h)

          # Consider returning 206 if not full response
          # or a 416 if the range is outside of the range of records

          {
            count: count,
            page: page,
            clients: objects
          }
        rescue Roda::RodaPlugins::TypecastParams::Error => e
          {
            error: {
              param: e.param_name,
              message: e.reason
            }
          }
        end
      end
    end
  end
end

