class CommentsController < ApplicationController
  def create
    @article = Article.find(id: params[:article_id])
    @comment = @article.add_comment(comment_params)
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id)
  end
end