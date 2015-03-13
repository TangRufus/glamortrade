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
    super && (admin? || owned?)
  end

  def create?
    admin? || normal_user?
  end

  def update?
    admin? || normal_user?
  end

  def permitted_attributes
    if admin?
      [:name, :description, :commission_rate, :ads_budget, variants_attributes: [:id, :name, :minimum_price, :inventory, :our_sku, :your_sku, :commission_rate]]
    else
      [:name, :description, :ads_budget, variants_attributes: [:id, :name, :minimum_price, :inventory, :your_sku]]
    end
  end

  private
  def owned?
    normal_user? && record.company == user.company
  end
end
