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

  private
  def owned?
    normal_user? && record == user.company
  end
end
