class CommentsController < ApplicationController
  def create
    @advertisement = Advertisement.find(params[:advertisement_id])
    @user = User.find(session[:user_id])
    @comment = @advertisement.comments.create(comment_params)
    redirect_to advertisement_path(@advertisement)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
