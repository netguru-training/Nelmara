module CommentsHelper
  def can_delete?(comment)
    user_signed_in? && (current_user == comment.user)
  end
end

