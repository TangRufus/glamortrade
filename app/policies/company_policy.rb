class CompanyPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin? || owned?
  end

  def create?
    admin?
  end

  def update?
    admin? || owned?
  end

  def permitted_attributes
    if admin?
      [:name, :domain_url, :low_stock_contact_email, :out_of_stock_contact_email, :delivery_contact_email]
    else
      [:low_stock_contact_email, :out_of_stock_contact_email, :delivery_contact_email]
    end
  end

  private
  def owned?
    normal_user? && record == user.company
  end
end
