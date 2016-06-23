class VenuesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :comment
 
  def index
    if params[:search] != nil
      @venues = Venue.search(params[:search])
    else
      @venues = Venue.all.order(city: :desc)
    end
    render :index
  end

  def new
    @venue = Venue.new
    render :new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue
    else
      redirect_to new_venue_path, flash: {error: @venue.errors.full_messages.to_sentence}
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @comments = @venue.comments.order(id: :asc)
    render :show
  end

  def comment
    @venue = Venue.find(params[:id])
    @user = current_user
    @comment = @user.comments.create(comment_params)
    @venue.comments.push(@comment)
    redirect_to @venue   
  end

  def city
    @venue = Venue.where(city: params[:city])
    render :_city
  end

  def edit
    @venue = Venue.find(params[:id])
    render :edit
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update_attributes(venue_params)
    redirect_to @venue
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to "/venues"
  end

  private
  def venue_params
    params.require(:venue).permit(:name, :street_one, :street_two, :city, :state, :zipcode, :phone_number, :email, :description, :profile_pic)
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
