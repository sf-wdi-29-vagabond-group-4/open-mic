class CommentsController < VenuesController 
  skip_before_filter :verify_authenticity_token

  def create
    @venue = Venue.find(params[:venue_id])
    @user = current_user
    @comment = @user.comments.create(comment_params)
    @venue.comments.push(@comment)
    redirect_to @venue   
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end

