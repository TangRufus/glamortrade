class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if admin?
        scope.all
      else
        current_company
      end
    end
  end

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
      [:name, :email_host, :inventory_contact_email, :commission_rate]
    else
      [:inventory_contact_email]
    end
  end

  private
  def owned?
    normal_user? && record == user.company
  end
end
