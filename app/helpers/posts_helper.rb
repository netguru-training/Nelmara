module PostsHelper
  def active_sort(sort)
    active = if sort == "best" then params[:best] else !params[:best] end
    active ? "active" : ""
  end
end
