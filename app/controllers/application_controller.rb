class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, unless: :skip_pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_access

  devise_group :person, contains: [:user, :admin]

  protected

  def layout_by_access
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def pundit_user
    current_person
  end

  private
  def skip_pundit
    devise_controller? || high_voltage_controller?
  end

  def high_voltage_controller?
    controller_path == "high_voltage/pages"
  end
end
