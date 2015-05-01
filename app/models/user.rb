class User < ActiveRecord::Base
  # Generally, I'd remove auto-generated comments unless they are needed.
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stories
  has_many :comments
  has_many :importance_markers

  # this is a clever way of doing this as a proof of concept,
  #but note that it's not guaranteed to be unique!
  def username
    username = self.email.split('@').first
  end
end
