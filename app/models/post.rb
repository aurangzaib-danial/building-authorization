class Post < ApplicationRecord
  has_many :shared_posts, dependent: :delete_all
  has_many :users, through: :shared_posts

  validates_presence_of :title, :body

  PERMISSIONS = {
      :owner => 0,
      :collaborator => 10,
      :guest => 100
  }

  def add_owner(user)
    shared_posts.build(user: user, permission: PERMISSIONS[:owner])
  end

  def owner
    @owner ||= users_by_permission(PERMISSIONS[:owner]).first
  end

  def users_by_permission(permission)
    User.by_post_and_permission(self, permission)
  end

  def collaborators
    users_by_permission(PERMISSIONS[:collaborator])
  end

  def guests
    users_by_permission(PERMISSIONS[:guest])
  end

end
