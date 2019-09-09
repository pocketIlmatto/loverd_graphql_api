class SeedHelper

  SITE_NAMES = ['Mussel Rock', 'Blue Rock', 'Ed Levin', 'The Whaleback',
    'Tollhouse', 'Potato', 'Skyport', 'Sand City']

  def self.seed_site(name)
    Site.create(name: name,
      lat: rand(90000000).fdiv(1000000),
        lon: rand(180000000).fdiv(1000000))
  end

  def self.seed_site_data(data_points, site_id = nil)
    current_time = Time.now.utc
    site = site_id.nil? ? nil : Site.find_by(id: site_id)

    batches = ['gfs', 'hrrr', 'nam3', 'nam12'].map do |model|
      SeedHelper.create_forecast_batch(model, current_time)
    end

    if site
      SeedHelper.create_site_data(data_points, site, current_time, batches)
    else
      Site.all.each do |site|
        current_time = site.site_data.present? ? [site.site_data.last.timestamp, current_time].max : current_time
        SeedHelper.create_site_data(data_points, site, current_time,
          batches)
      end
    end
  end

  def self.create_forecast_batch(model, current_time)
    ForecastBatch.create(model: model, model_rundate: current_time - 6.hours)
  end

  def self.create_forecasted_site_data(num_points, site, current_time, batches)
    batches.each do |batch|
      [['fct_temp', 40, 100, 'F'],
      ['fct_pressure', 1008, 1020, 'mbar'],
      ['fct_wind_speed', 0, 30, 'km/h']].each do |data|
        num_points.times do |t|
          site.site_data.create(
            forecast_batch_id: batch.id,
            parameter_type: data[0],
            value: rand(data[1]..data[2]),
            timestamp: current_time + t.hours,
            unit: data[3])
        end
      end
    end
  end

  def self.create_site_data(num_points, site, current_time, batches)
    # Current conditions
    [['current_temp', 40, 100, 'F'],
    ['current_pressure', 1008, 1020, 'mbar'],
    ['current_wind_speed', 0, 30, 'km/h'],
    ['flyability_score', -1, 1, 'mbar']].each do |data|
      num_points.times do |t|
        site.site_data.create(
          parameter_type: data[0],
          value: rand(data[1]..data[2]),
          timestamp: current_time + t.hours,
          unit: data[3])
      end
    end

    SeedHelper.create_forecasted_site_data(num_points, site, current_time,
      batches)
  end

end