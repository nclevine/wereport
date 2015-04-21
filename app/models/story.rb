class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighborhood
  belongs_to :location
  belongs_to :category
  has_many :comments, dependent: :destroy
end
