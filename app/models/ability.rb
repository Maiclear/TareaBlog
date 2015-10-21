class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 3) # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.editor?
      can :read, :all
      can :create, :all
      can :update, [Post, Comment]
      can :destroy, [Post, Comment], user_id: user.id
    elsif user.basic?
      can :read, :all
      can :create, [Post, Comment]
      can [:update, :destroy], [Post, Comment], user_id: user.id
    else
      can :read, :all
    end

  end
end
