class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:create, :destroy]
 # before_action :comment_owner!, only: [:destroy]
 
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.email = current_user.id.to_i
    if @comment.save
#      @comment.email = current_user.email.to_s
      redirect_to article_path(@article), notice: 'Thank you for your comment' "#{current_user.email.to_s}"
      #, ' "#{@comment.user_id}"
    else
      redirect_to article_path(@article), alert: 'Unable to add comment'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), notice: 'Comment deleted'
  end

  private
    def load_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

    def comment_owner!
      authenticate_user!
#         @user = User.find(params[:id])
#      @comment = @article.comments.find(params[:user_id])
#      if @comment != current_user.id
      @article = Article.find(params[:article_id])
      if @user != current_user.id
        redirect_to article_path(@article)
        flash[:notice] = "You do not have enough permission to do this"
      end
    end
end
