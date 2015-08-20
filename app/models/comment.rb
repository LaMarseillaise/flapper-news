class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :body, :post, :user, presence: true

  def as_json(options = {})
    super(options.merge(include: :user))
  end

end
