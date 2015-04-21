class Story < ActiveRecord::Base
  validates :title, :body, :category_id, :neighborhood_id, :location_id, :user_id, presence: true

  belongs_to :user
  belongs_to :neighborhood
  belongs_to :location
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :importance_markers
end
