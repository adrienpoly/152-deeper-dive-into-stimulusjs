class County < ApplicationRecord
  belongs_to :state
  has_many :cities

  scope :name_asc, -> { order(name: :asc) }
  scope :select_collection, -> { name_asc.map { |s| [s.name, s.id, { url: Rails.application.routes.url_helpers.state_county_cities_path(state_id: s.state_id, county_id: s.id) }] } }
end
