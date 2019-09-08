class SeedHelper

  def self.seed_site
    Site.create(name: Faker::Nation.capital_city,
      lat: rand(90000000).fdiv(1000000),
        lon: rand(180000000).fdiv(1000000))
  end

  def self.seed_site_data(data_points, site_id = nil)
    current_time = Time.now.utc
    site = site_id.nil? ? nil : Site.find_by(id: site_id)
    if site
      SeedHelper.create_site_data(data_points, site, current_time)
    else
      Site.all.each do |site|
        current_time = [site.site_data.last.timestamp, current_time].max
        SeedHelper.create_site_data(data_points, site, current_time)
      end
    end
  end

  def self.create_site_data(data_points, site, current_time)
    [['current_temp', 40, 100, 'F'],
    ['current_pressure', 1008, 1020, 'mbar'],
    ['current_wind_speed', 0, 30, 'km/h'], ['fct_temp', 40, 100, 'F'],
    ['current_pressure', 1008, 1020, 'mbar'],
    ['current_wind_speed', 0, 30, 'km/h']].each do |data|
      data_points.times do |t|
        site.site_data.create(parameter_type: data[0],
          value: rand(data[1]..data[2]), timestamp: current_time + t.hours,
          unit: data[3])
      end
    end
  end

end