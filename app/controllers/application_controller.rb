class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  devise_group :person, contains: [:user, :admin]

  layout :layout_by_access

  before_action :authenticate_person!, unless: :skip_authenticate?
  after_action :verify_authorized, :except => :index, unless: :skip_authenticate?
  after_action :verify_policy_scoped, :only => :index, unless: :skip_authenticate?

  def after_sign_in_path_for(resource)
    if current_user.present?
      dashboard_path
    else
      companies_path
    end
  end

  protected
  def current_company
    current_user.company if current_user.present?
  end

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
  def skip_authenticate?
    devise_controller?
  end
end
