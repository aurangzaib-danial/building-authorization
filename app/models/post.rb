class Post < ApplicationRecord
  has_many :shared_posts
  has_many :users, through: :shared_posts

  validates_presence_of :title, :body

  PERMISSIONS = SharedPost::PERMISSIONS

  def self.permissions_for(*args)
    args.each do |arg|
      define_method "#{arg}able_by?" do |user|
        relation = shared_posts.find_by(user: user)

        relation.send("#{arg}able?") if relation
      end
    end
  end

  permissions_for :view, :edit, :manage

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
