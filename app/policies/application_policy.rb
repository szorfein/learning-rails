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
    user.try(:admin?) || record.has_member?(user)
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.try(:admin?) || record.roles.exists?(user_id: user, role: 'manager')
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
