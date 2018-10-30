class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(u)
    # Define abilities for the passed in user here. For example:
    #
    # user ||= User.new # guest user (not logged in)

    @user = u

    if @user.blank?
      roles_for_guest
    elsif @user.admin?
      roles_for_admin
    else
      roles_for_member
    end

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  private

  def roles_for_guest
    can :read, Image    
  end

  def roles_for_member
    can :manage, Image, user_id: user.id

    can :read, Image
    can :create, Image
  end

  def roles_for_admin
    can :manage, :all
  end
end
