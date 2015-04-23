class Location < ActiveRecord::Base
  validates :address, :neighborhood_id, presence: true

  belongs_to :neighborhood
  has_many :stories

  geocoded_by :address
  after_validation :geocode
end
