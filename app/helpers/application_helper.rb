module ApplicationHelper
  def current_company
    current_user.company if current_user.present?
  end
end
