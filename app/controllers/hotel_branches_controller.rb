class HotelBranchesController < ApplicationController

  before_action :require_user
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # Display list of all hotels in the order of created dates 
  def index
    @hotels = HotelBranch.all.order('created_at ASC')
    @hotel = HotelBranch.new
  end

  # Display details of specific hotel
  def show
  end
  
  # Create a new hotel
  def new
    @hotel = HotelBranch.new
  end

  # Save the new hotel to database
  def create
    @hotel = HotelBranch.new(hotel_params)
    if @hotel.save
      respond_to do |format|
        format.html { redirect_to hotels_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js {render 'errors'}
      end
    end
  end

  # To edit a specific hotel details
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # Updating the edited hotel details to database 
  def update
    if @hotel.update(hotel_params)
      respond_to do |format|
        format.html { redirect_to hotels_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js {render 'errors'}
      end
    end
  end

  # Deleting the existing hotel
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotel_branches_path, notice: 'Hotel was successfully destroyed.' }
      format.js   { render }
    end
  end

  private 

    # private method to find hotel with hotel_branch_id
    def set_hotel
      @hotel = HotelBranch.find(params[:id])
    end

    # private method to pass hotel parameters for creating and updating hotels
    def hotel_params
      params.require(:hotel_branch).permit(:name, :address, :city, :state, :country, :phone, :website, :location_id, :client_id)
    end

end