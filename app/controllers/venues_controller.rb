class VenuesController < ApplicationController

  def index
    @venues = Venue.all.order(id: :desc)
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
      redirect_to new_venue_path
    end
  end

  def show
    @venue = Venue.find(params[:id])
    render :show
  end


  private
  def venue_params
    params.require(:venue).permit(:name, :street_one, :street_two, :city, :state, :zipcode, :phone_number, :email, :description, :profile_pic)
  end

end
