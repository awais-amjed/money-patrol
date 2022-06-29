# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :manage, Category, user: user

    return unless user.is? :admin
    can :manage, :all
  end
end
