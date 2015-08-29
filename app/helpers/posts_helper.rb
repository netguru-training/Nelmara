module PostsHelper
  def can_edit?(post)
    user_signed_in? && (current_user == post.user)
  end
end

