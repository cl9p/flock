# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'DEFAULT USERS'
#user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
user = User.create! :name => "Lee Faus", :email => "lee@cloudninepartners.com", :password => "password", :password_confirmation => "password"
puts 'user: ' << user.name
project = Project.create! :name => "Flock", :platform => "Amazon", :location => "EAST"

configuration_1 = Configuration.create! :name => "x-small", :cpu => 1, :memory => 256, :disk_size => 1024
configuration_2 = Configuration.create! :name => "small", :cpu => 2, :memory => 512, :disk_size => 2048
configuration_3 = Configuration.create! :name => "medium", :cpu => 2, :memory => 1024, :disk_size => 4096
configuration_4 = Configuration.create! :name => "large", :cpu => 4, :memory => 2048, :disk_size => 8192
configuration_5 = Configuration.create! :name => "x-large", :cpu => 4, :memory => 4096, :disk_size => 16384
configuration_6 = Configuration.create! :name => "xx-large", :cpu => 8, :memory => 8192, :disk_size => 32768

template_1 = VMware.create! :name => "docker-base", :os_name => "ubuntu", :os_version => "13.04", :container_support => true, :version => "1.0.10", :vcenter_host => "10.0.1.10", :vcenter_user_name => "root", :vcenter_password => "password", :base_image_name => "docker", :clone_to_location => "development"
template_1.configurations = [configuration_3, configuration_4, configuration_5, configuration_6]
template_1.save!
puts template_1.name
template_2 = Amazon.create! :name => "docker-base", :os_name => "ubuntu", :os_version => "13.04", :container_support => true, :version => "1.0.10", :amazon_access_key => "AKIAJPFXLSET4DKRHPDA", :amazon_secret_key => "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", :ami_id => "ami-bd0959d4"
template_2.configurations = [configuration_1, configuration_2, configuration_3]
template_2.save
puts template_2.name


