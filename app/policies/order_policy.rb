class OrderPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if admin?
        scope.all
      else
        current_company.orders
      end
    end
  end


  def index?
    admin? || normal_user?
  end

  def create?
    admin?
  end

  private
  def owned?
    normal_user? && record == user.company
  end
end
