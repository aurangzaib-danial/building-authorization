class Post < ApplicationRecord
  has_many :shared_posts
  has_many :users, through: :shared_posts

  def self.permissions_for(*args)
    args.each do |arg|
      define_method "#{arg}able_by?" do |user|
        relation = shared_posts.find_by(user: user)

        relation.send("#{arg}able?") if relation
      end
    end
  end

  permissions_for :view, :edit

end
