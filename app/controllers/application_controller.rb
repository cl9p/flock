class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_user
  
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "authentication"
    else
      "application"
    end
  end
  
    def set_current_user
      User.current_user = current_user
    end
end
