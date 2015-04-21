class Neighborhood < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :stories
end
