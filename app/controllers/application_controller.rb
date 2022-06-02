class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :set_time_zone, if: :current_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location, :photo, :time_zone])
  end

  def set_time_zone(&block)
    Time.zone = current_user.time_zone, &block
  end
end
