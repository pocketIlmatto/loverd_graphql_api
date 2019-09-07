module Types
  class QueryType < Types::BaseObject
    field :sites, [Types::SiteType], null: false

    def sites
      Site.all
    end

    field :site, Types::SiteType, null: false do
      argument :id, ID, required: true
    end

    def site(id:)
      Site.find(id)
    end
  end
end
