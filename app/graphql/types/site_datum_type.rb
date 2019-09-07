module Types
  class SiteDatumType < Types::BaseObject
    field :parameter_type, String, null: false
    field :timestamp, Types::DateTimeType, null: false
    field :value, String, null: true
    field :unit, String, null: true
  end
end
