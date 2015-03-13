class BillPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if admin?
        scope.all.order(updated_at: :desc)
      else
        current_company.bills.order(updated_at: :desc)
      end
    end
  end

  def index?
    admin? || normal_user?
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def permitted_attributes
    if admin?
      [:company_id, :amount, :title, :description]
    end
  end
end
