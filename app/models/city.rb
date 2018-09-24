class City < ApplicationRecord
  belongs_to :county, optional: true
  has_many :accounts

  scope :name_asc, -> { order(name: :asc) }
  scope :select_collection, -> { name_asc.map { |s| [s.name, s.id] } }
end
