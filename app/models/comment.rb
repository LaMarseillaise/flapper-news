class Comment < ActiveRecord::Base
  belongs_to :post

  validates :body, :post, presence: true
end
