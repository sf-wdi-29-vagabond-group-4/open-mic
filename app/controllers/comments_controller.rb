class CommentsController < VenuesController 

  def create
    @venue = Venue.find(params[:venue_id])
    @user = current_user
    @comment = @user.comments.create(comment_params)
    @venue.comments.push(@comment)
    redirect_to @venue   
  end

  def edit
    @comment = Comment.find(params[:id])
    render :edit
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to venue_path(params[:venue_id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update_attributes(comment_params)
    redirect_to "/venues/#{comment.venue.id}"
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end

