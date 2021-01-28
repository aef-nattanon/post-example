# frozen_string_literal: false

# Class PostPolicy
class PostPolicy < ApplicationPolicy
  # Class Scope
  class Scope < Scope
    def resolve
      if user.has_role?(:admin)
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def update?
    user.present? and user.has_role?(:admin) or user == post.user
  end

  def destroy?
    user.present? and user.has_role?(:admin) or user == post.user
  end

  private

  def post
    record
  end
end
