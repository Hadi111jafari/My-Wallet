class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User

    return unless user.present?

    can :manage, Group, user: user
    can :manage, Expense, user: user
    can :manage, User, user: user
  end
end
