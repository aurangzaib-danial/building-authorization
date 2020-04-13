class ApplicationController < ActionController::Base

  def can_current_user?(action, object)
    if object.send("#{action}able_by?", current_user)
      true
    else
      action = 'delete' if action == :destroy
      redirect_to root_path, alert: "You are not allowed to #{action} this post"
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_path
  end

end
