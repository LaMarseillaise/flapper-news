class Post < ActiveRecord::Base

  has_many :comments

  validates :title, :link, presence: true

end
