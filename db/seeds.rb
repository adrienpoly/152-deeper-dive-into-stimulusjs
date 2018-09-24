# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach(File.open('db/us.csv'), headers: true) do |row|
  data_hash = row.to_hash
  state = State.find_or_create_by!(name: data_hash['state_name'], abbr: data_hash['state_id'])
  county = County.find_or_create_by!(name: data_hash['county_name'], state_id: state.id)
  city = City.find_or_create_by!(name: data_hash['city'], county_id: county.id)
end
