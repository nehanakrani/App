class ApplicationPolicy
  attr_reader :user, :record
  def initialize(user, record)
    @user = user
    @record = record
  end
#when assigne role return user is admin or not 
  def is_admin?
    user.has_role?(:admin)
  end
  def is_user?
    user.has_role?(:user)
  end
  def is_allowed?
    user.has_role?(:user, record)
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
class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    def resolve
      if user.admin?
        scope.all? 
      else 
      scope.where(:event_id =>user.events.select(:user_id))

      end
    end
  end
end

