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
template = Template.new :image_location => "/root/golden_images/ubuntu-13.04", :provider => "vmware", :name => "ubuntu-jeos", :os_name => "ubuntu", :os_version => "13.04", :container_support => true, :version => "1.0.10"
template.configurations << configuration_3
template.configurations << configuration_4
template.configurations << configuration_5
template.configurations << configuration_6
template.save!
puts 'template: ' << template.os_name
puts 'template:configs' << template.configurations.inspect
template = Template.create! :image_location => "/root/golden_images/ubuntu-13.04", :provider => "amazon", :name => "ubuntu-docker", :os_name => "ubuntu", :os_version => "13.04", :container_support => true, :version => "1.0.10"
template = Template.create! :image_location => "/root/golden_images/ubuntu-13.04", :provider => "rackspace", :name => "fedora-web-php", :os_name => "fedora", :os_version => "19", :container_support => true, :version => "1.0.10"
template = Template.create! :image_location => "/root/golden_images/ubuntu-13.04", :provider => "openstack", :name => "centos-java7", :os_name => "centos", :os_version => "6.4", :container_support => true, :version => "1.0.10"