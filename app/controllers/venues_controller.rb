class VenuesController < ApplicationController
  before_action :require_login, only: [:show]

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
    params[:venue][:admin_id] = current_user.id
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue
    else
      redirect_to new_venue_path, flash: {error: @venue.errors.full_messages.to_sentence}
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @current_user_id = current_user.id
    @comments = @venue.comments.order(id: :asc)

    render :show
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
    params.require(:venue).permit(:name, :street_one, :street_two, :city, :state, :zipcode, :phone_number, :email, :description, :profile_pic, :admin_id, :full_address)
  end

end
