class PostPolicy < ApplicationPolicy
  def update?
    record.user == user
  end

  def vote?
    record.user != user
  end
end
