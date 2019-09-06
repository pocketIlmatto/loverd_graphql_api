class CreateSiteData < ActiveRecord::Migration[5.2]
  def change
    create_table :site_data do |t|
      t.belongs_to :site, foreign_key: true
      t.string :parameter_type
      t.datetime :timestamp
      t.string :value
      t.string :unit

      t.timestamps
    end
  end
end
