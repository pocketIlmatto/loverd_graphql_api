class CreateForecastBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :forecast_batches do |t|
      t.string :model
      t.datetime :model_rundate

      t.timestamps
    end

    add_column :site_data, :forecast_batch_id, :integer
    add_foreign_key :site_data, :forecast_batches, index: true
  end
end
