module PostsHelper
  def user_name(post)
    if post.user_id
      post.user.name
    else
      "ゲストユーザー"
    end
  end
end
