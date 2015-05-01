class Story < ActiveRecord::Base
  validates :title, :body, :category_id, :neighborhood_id, :user_id, :location_id, presence: true

  belongs_to :user
  belongs_to :neighborhood
  belongs_to :location
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :importance_markers

  acts_as_punchable

  def preview
    preview = self.body.split[0..5].join(' ') + '...'
  end

  def username
    # this is not DRY, I believe you could just define this method as:
    # return self.user.username
    # since a user has a username method.
    # in fact you can delegate the username method to the user object (look up
    # method delegation in ruby.
    username = self.user.email.split('@').first
  end

  mount_uploader :photo, PhotoUploader
end
