class Comment < ActiveRecord::Base
  belongs_to :aritcle
  def create
    @post = Aritcle.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    flash[:notice] = "Comment has been created!"
    redirect_to posts_path
  end

end
