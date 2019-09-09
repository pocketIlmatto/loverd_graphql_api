namespace :seed do

  desc 'Seed Sites and SiteData'
  task :sites_and_site_data, [:data_points] => :environment do |_, args|
    SeedHelper::SITE_NAMES.each do |name|
      next if Site.find_by(name: name)
      site = SeedHelper.seed_site(name)

    end
    SeedHelper.seed_site_data(args[:data_points].to_i)
  end

  desc 'Seed SiteData'
  task :site_data, [:num_data_points] => :environment do |_, args|
    SeedHelper.seed_site_data(args[:num_data_points].to_i)
  end

end