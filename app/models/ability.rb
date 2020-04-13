# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :permissions, to: :read
    if user
      can :read, Post do |post|
        check_post_permission(post, user, :guest)
      end
      can :update, Post do |post|
        check_post_permission(post, user, :collaborator)
      end
      can :manage, Post do |post|
        check_post_permission(post, user, :owner)
      end
    end
  end

  def check_post_permission(post, user, permission)
    relation = post.shared_posts.find_by(user: user)
    relation.permission <= Post::PERMISSIONS[permission] if relation
  end
end
