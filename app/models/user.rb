class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :shared_posts
  has_many :posts, through: :shared_posts

  def self.by_post_and_permission(post, permission)
    joins(:shared_posts).where(shared_posts: { permission: permission, post: post})
  end

  def self.not_associated_with(post)
    where.not(id: post.user_ids)
  end
end
