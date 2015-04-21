class Location < ActiveRecord::Base
  validates :name, :neighborhood_id, presence: true

  belongs_to :neighborhood
  has_many :stories
end
