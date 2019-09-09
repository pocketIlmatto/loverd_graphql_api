module Types
  class SiteDatumType < Types::BaseObject
    field :id, Integer, null: false
    field :parameter_type, String, null: false
    field :timestamp, Types::DateTimeType, null: false
    field :value, String, null: true
    field :unit, String, null: true
    field :forecast_model, String, null: true

    def forecast_model
      object.forecast_batch.try(:model)
    end

  end
end
