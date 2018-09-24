class State < ApplicationRecord
  has_many :counties

  scope :name_asc, -> { order(name: :asc) }
  scope :select_collection, -> { name_asc.map { |s| [s.name, s.id, { url: Rails.application.routes.url_helpers.state_counties_path(s) }] } }
end
