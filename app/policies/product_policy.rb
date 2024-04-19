class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.user == user
  end

  def update?
    record.seller.user == user
  end

  def destroy?
    record.seller.user == user
  end
end
