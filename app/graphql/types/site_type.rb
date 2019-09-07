module Types
  class SiteType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :lat, Float, null: true
    field :lon, Float, null: true
    field :site_data, [Types::SiteDatumType], null: true
  end
end
