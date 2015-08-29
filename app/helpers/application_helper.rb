module ApplicationHelper
  def display_tag(tag)
    "##{tag}"
  end

  def is_author?(record)
    user_signed_in? && (current_user == record.user)
  end
end

