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

  def find(id)
    clients.by_pk(id)
  end

  def count
    clients.count
  end
end
