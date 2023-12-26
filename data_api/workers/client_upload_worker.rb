# TODO get this Sidekiq worker implemented.
require 'sidekiq'

# require 'pry'
# require 'csv'

# require_relative 'services/gpg_engine'
# require_relative 'services/file_decryptor'

Sidekiq.configure_server do |config|
  #TODO these environeemnt variables would need to be configured because we don't have an ENV file.
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

class ClientUploadWorker
  include Sidekiq::Worker
  def perform(encrypted_file_content)
    # #TODO the code that is in the api.rb file currently, would have to be moved into this worker.
    # encrypted_file_content = request.body.read

    # # TODO figure out a way to get the GPG Engine to work since it is cleaner than the Tempfile method of decryption
    # # decrypted_file_content = GPG.decrypt(encrypted_file_content).read
    
    # decrypted_file_content = FileDecryptor.execute(encrypted_file_content)
    # decrypted_csv = CSV.parse(decrypted_file_content, :headers => true)


    # # TODO Break this "update" client code out into a new module or something so this route is single responsibility & not so fat.
    # decrypted_csv.each do | row_data |
    #     id = row_data.first[1]
    #     client = client_repo.find(id)

    #     if client.count == 0
    #         client.changeset(:create, id: id).commit
    #     end

    #     # TODO figure out a way to pass multiple update params at once, like you can in ActiveRecord's update or create methods.
    #     # That way we don't have to make an update call on each field of data that comes from the CSV file.
    #     row_data.each do | update_pair |
    #         update_hash = {}
    #         update_hash[update_pair[0]] = update_pair[1]

    #         # TODO figure out a way to get a custom "update" method on the ClientRepository.
    #         # client.update(update_hash)

    #         # FIX the other data fields for a client is not updating after it doesn't exist yet,
    #         # and we create the new record on line 63.  All fields, but the ID are currently showing "null".

    #         client.changeset(:update, update_hash).commit
    #     end
    # end
  end
end

# # this command will call this worker in the api.rb file:
# encrypted_file_content = request.body.read
# Sidekiq::Client.push('class' => ClientUploadWorker, 'queue' => 'default', 'args' => [encrypted_file_content])