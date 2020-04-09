class ApplicationController < ActionController::Base

  def can_current_user?(action, object)
    object.send("#{action}able_by?", current_user)
  end
end
