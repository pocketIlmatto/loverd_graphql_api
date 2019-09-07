module Types
  class SiteType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :lat, Float, null: true
    field :lon, Float, null: true
    field :site_data, [Types::SiteDatumType], null: true
    field :filtered_site_data, [Types::SiteDatumType], null: true do
      argument :parameter_type, String, required: false, default_value: "current_temp"
    end

    def filtered_site_data(parameter_type:)
      object.site_data.current.where(parameter_type: parameter_type)
    end

  end
end
