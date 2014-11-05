# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

security = NotificationType.find_or_create_by! name: "Security", alert_message: "Hi fellow group members. We have a security situation around here."
ambulance = NotificationType.find_or_create_by! name: "Ambulance", alert_message: "Hi fellow group members. We have a medical emergency around here."
fire = NotificationType.find_or_create_by! name: "Fire Station", alert_message: "Hi fellow group members. We have some fire burning around here."