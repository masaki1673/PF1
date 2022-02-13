class PostCommentsController < ApplicationController
  def create
    comic = Comic.find(params[:comic_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.comic_id = comic.id
    comment.save
    redirect_to comic_path(comic)
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to comic_path(params[:comic_id])
  end
  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
