class Post < ActiveRecord::Base
  accessible_attributes :content

  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 200}

  default_scope { order('created_at DESC') }

end
