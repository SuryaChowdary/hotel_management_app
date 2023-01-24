class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  # Display a list of all clients
  def index
    @clients = Client.all.order('created_at ASC')
    @client = Client.new
  end

  # Display the details of a specific client 
  def show
    @hotel = HotelBranch.new
    @room_facility_categories = RoomFacilityCategory.all
    @regions = Region.all
    @locations = Location.all
  end
  
  # Create a new client
  def new
    @client = Client.new
  end

  # Edit an existing client
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # Save a new client to database
  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id
    if @client.save
      respond_to do |format|
        format.html { redirect_to clients_path }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js {render 'errors'}
      end
    end
  end

  # Update details of an existing client
  def update
    if @client.update(client_params)
      respond_to do |format|
        format.html { redirect_to clients_path, notice: 'Client was successfully updated.' }
        format.js { }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js { render 'errors' }
      end
    end
  end

  # Delete an existing client 
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url  }
      format.js   { render }
    end
  end

  # Add hotels to the client by fetching hotel branches based on the selected ids
  def add_hotels
    @client = Client.find(params[:id])
    hotel_branch_ids = params[:hotel_branch_ids]
    @hotel_branches = HotelBranch.where(id: hotel_branch_ids)
    @client.hotel_branches << @hotel_branches
    @client.save
    respond_to do |format|
      format.html {redirect_to @client}
      format.js
    end
  end

  # Add rooms to the client by creating a new room for the selected hotel branch
  def add_rooms
    @client = Client.find(params[:id])
    hotel_branch = HotelBranch.find(params[:room][:hotel_branch_id])
    @room = hotel_branch.rooms.new(room_params)
    if @room.save
      respond_to do |format|
        format.html { redirect_to @client }
        format.js
      end
    else
      flash[:alert] = "Error adding room"
      redirect_to @client
    end
  end

  # Add room facilities to the client by creating a new room facility for the selected room
  def add_room_facilities
    @client = Client.find(params[:id])
    room = Room.find(params[:room_facility][:room_id])
    @room_facility = room.room_facilities.new(room_facility_params)
    if @room_facility.save
      respond_to do |format|
        format.html { redirect_to @client }
        format.js
      end
    else
      flash[:alert] = "Error adding room facility"
      redirect_to @client
    end
  end

  # Add room facility categories to the client by creating a new room facility category
  def add_room_facility_categories
    @client = Client.find(params[:id])
    @room_facility_category = RoomFacilityCategory.new(room_facility_category_params)
    if @room_facility_category.save
      respond_to do |format|
        format.html { redirect_to @client }
        format.js
      end
    else
      flash[:alert] = "Error adding room facility category"
      redirect_to @client
    end
  end

  # Fetch locations dynamically on selecting regions
  def locations_by_region
    @locations = Location.where(region_id: params[:regions])
    respond_to do |format|
      format.js { render :locations_by_region }
    end
  end

  private

    # private method to find client by client_id
    def set_client
      @client = Client.find(params[:id])
    end

    # private method to pass client parameters for creating and updating clients 
    def client_params
      params.require(:client).permit(:name, :user_id,location_ids:[], region_ids:[])
    end

    # private method to pass room parameters for adding rooms 
    def room_params
      params.require(:room).permit(:name, :capacity, :price)
    end

    # private method to pass room_facility parameters for adding facilities 
    def room_facility_params
      params.require(:room_facility).permit(:name, :room_id, :room_facility_category_id)
    end

    # private method to pass room_facility_category parameters to add a category for room facilities
    def room_facility_category_params
      params.require(:room_facility_category).permit(:name)
    end
    
end
