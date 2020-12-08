class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user.admin
  end

  def destroy?
    user.admin
  end

  def register?
    user.admin
  end
end
