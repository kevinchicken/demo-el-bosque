# frozen_string_literal: true

# Abiliy class defines the permission each role has over resources
class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, News, public: true

    return unless user.admin?

    can :manage, News
  end
end
