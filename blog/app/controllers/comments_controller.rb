class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article =@article
    @comment.save
    redirect_to article_path(@article)
  end

  private

    def comment_params
      params.permit(:commenter, :body)
    end

end
