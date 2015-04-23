class Location < ActiveRecord::Base
  validates :name, :neighborhood_id, presence: true

  belongs_to :neighborhood
  has_many :stories

  geocoded_by :address
  after_validation :geocode
  #below is suppose to use dirty tracking
  #after_validation :geocode, :if => :address_change?
end
