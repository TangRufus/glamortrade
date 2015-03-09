module ApplicationHelper
  def current_company
    current_user.company if current_user.present?
  end

  def number_to_yen number, options = {}
    number_to_currency number, unit: "&yen;"
  end
end
