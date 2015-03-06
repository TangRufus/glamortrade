class ProductPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if admin?
        scope.all
      else
        current_company.products
      end
    end
  end


  def index?
    admin? || normal_user?
  end

  def show?
     admin? || (super && owned?)
  end

  def create?
    admin? || normal_user?
  end

  def update?
    admin? || normal_user?
  end

  private
  def owned?
    normal_user? && record.company == user.company
  end
end
