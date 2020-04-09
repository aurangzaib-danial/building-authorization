class ApplicationController < ActionController::Base

  def can_current_user?(action, object)
    object.viewable_by?(current_user)
  end
end
