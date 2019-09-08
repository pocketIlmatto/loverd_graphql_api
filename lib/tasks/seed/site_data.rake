namespace :seed do

  desc 'Seed Sites and SiteData'
  task :sites_and_site_data, [:sites, :data_points] => :environment do |_, args|
    args[:sites].to_i.times do
      site = SeedHelper.seed_site
      SeedHelper.seed_site_data(args[:data_points].to_i, site.id)
    end
  end

  desc 'Seed SiteData'
  task :site_data, [:num_data_points] => :environment do |_, args|
    SeedHelper.seed_site_data(args[:num_data_points].to_i)
  end

end