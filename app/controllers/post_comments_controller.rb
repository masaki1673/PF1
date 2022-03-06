class PostCommentsController < ApplicationController
  def create
    @comic = Comic.find(params[:comic_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.comic_id = @comic.id
    if @comment.save
      flash.now = 'コメントを投稿しました'
      render :comic_post_comments
    else
      render :error
    end
  end

  def destroy
    PostComment.find_by(id: params[:id]).
    flash.now = '投稿を削除しました'
    @comic = Comic.find(params[:post_id])
    render :comic_post_comments
  end
  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
