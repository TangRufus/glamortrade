class DashboardPolicy < Struct.new(:user, :dashboard)
  def index
    user.present? && user.type == 'user'
  end
end
