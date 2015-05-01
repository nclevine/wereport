class Comment < ActiveRecord::Base
  validates :body, :story_id, :user_id, presence: true

  belongs_to :user
  belongs_to :story

  # see my notes in the story class regarding how to DRY this up
  def username
    username = self.user.email.split('@').first
  end
end
