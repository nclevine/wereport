class Comment < ActiveRecord::Base
  validates :body, :story_id, :user_id, presence: true

  belongs_to :user
  belongs_to :story
end
