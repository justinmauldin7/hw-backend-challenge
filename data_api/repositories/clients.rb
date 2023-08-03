require 'rom'
require 'rom-sql'

class Clients < ROM::Relation[:sql]
  schema(:clients, infer: true) do
    associations do
      has_many :policies
    end
  end

  def with_policies
    combine(:policies)
  end
end

class ClientRepository < ROM::Repository[:clients]
  commands :create

  def get_paged(page: 0, count: 50)
    clients.limit(count).offset(page * count)
  end

  # TODO See if there is a way to get this custom method to work
  # def update(update_hash)
  #   # Do something like this in here:
  #   self.changeset(:update, update_hash).commit
  # end

  def find(id)
    clients.by_pk(id)
  end

  def count
    clients.count
  end
end
