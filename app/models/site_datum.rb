class SiteDatum < ApplicationRecord
  belongs_to :forecast_batch, optional: true
  belongs_to :site

  scope :current, -> do
    where("timestamp >= ?", Time.zone.now.utc.change(min: 0))
    .order(timestamp: :asc)
  end
end
