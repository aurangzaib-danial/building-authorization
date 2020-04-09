class SharedPost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  PERMISSIONS = {
    :owner => 0,
    :collaborator => 10,
    :guest => 100
  }

  def self.permissable(*args)
    args.each do |arg|
      define_method "#{arg}able?" do
        case arg
        when :view
          permission <= PERMISSIONS[:guest]
        when :edit
          permission <= PERMISSIONS[:collaborator]
        when :destroy
          permission <= PERMISSIONS[:owner]
        end
      end
    end
  end

  permissable :view, :edit, :destroy
end
