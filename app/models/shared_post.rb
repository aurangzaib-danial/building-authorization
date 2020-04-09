class SharedPost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  PERMISSIONS = {
    :owner => 0,
    :collaborator => 10,
    :guest => 100
  }

  def viewable?
    permission <= PERMISSIONS[:guest]
  end
end
