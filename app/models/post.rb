class Post < ApplicationRecord
  has_many :shared_posts
  has_many :users, through: :shared_posts

  def viewable_by?(user)
    relation = shared_posts.find_by(user: user)

    relation.viewable? if relation
  end


end
