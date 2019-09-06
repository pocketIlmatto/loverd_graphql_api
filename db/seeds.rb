current_time = Time.now.utc
5.times do

  site = Site.create(name: Faker::Nation.capital_city, lat: rand(90000000).fdiv(1000000),
    lon: rand(180000000).fdiv(1000000))


  [['current_temp', 40, 100, 'F'],
    ['current_pressure', 1008, 1020, 'mbar'],
    ['current_wind_speed', 0, 30, 'km/h'], ['fct_temp', 40, 100, 'F'],
    ['current_pressure', 1008, 1020, 'mbar'],
    ['current_wind_speed', 0, 30, 'km/h']].each do |data|
      5.times do |t|
        site.site_data.create(parameter_type: data[0], value: rand(data[1]..data[2]),
          timestamp: current_time + t.hours, unit: data[3])
      end
  end

end