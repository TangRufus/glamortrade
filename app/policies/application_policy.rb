class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  protected
  def admin?
    user.present? && user.type == 'admin'
  end

  def normal_user?
    user.present? && user.type == 'user'
  end

  def current_company
    user.company if normal_user?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end

    protected
    def admin?
      user.present? && user.type == 'admin'
    end

    def normal_user?
      user.present? && user.type == 'user'
    end

    def current_company
      user.company if normal_user?
    end
  end
end

