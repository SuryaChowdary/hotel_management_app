class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @clients = Client.all.order('created_at ASC')
    @client = Client.new

  end

  def show
    @hotel = HotelBranch.new
    @room_facility_categories = RoomFacilityCategory.all
    @regions = Region.all
    @locations = Location.all
  end

  def new
    @client = Client.new
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end


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

  def update
    if @client.update(client_params)
      respond_to do |format|
        format.html { redirect_to @client }
        format.js { render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js 
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url  }
      format.js   { render }
    end
  end

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

  def locations_by_region
    @locations = Location.where("region_ids = ?", params[:region_ids])
    respond_to do |format|
      format.js 
    end
  end 

  def add_regions
    @client = Client.find(params[:id])
    region_ids = params[:region_ids]
    @regions = Region.where(id: region_ids)
    @client.regions << @regions
    @client.save
    respond_to do |format|
      format.html {redirect_to @client}
      format.js
    end
  end

  # def add_location
  #   @client = Client.find(params[:id])
  #   @region = Region.find(params[:region_id])
  #   @location = Location.find(params[:location_id])
  #   @region.locations << @location
  #   @client.regions << @region
  #   respond_to do |format|
  #     if @client.save
  #       format.js { render :add_location }
  #     end
  #   end
  # end
  # def add_location
  #   @client = Client.find(params[:id])
  #   if Region.exists?(params[:region].to_i)
  #     region = Region.find(params[:region].to_i)
  #     if Location.exists?(params[:location].to_i)
  #       location = Location.find(params[:location].to_i)
  #       if region.locations.include?(location)
  #         @client.locations << location
  #         @location = location
  #         if @client.save
  #           respond_to do |format|
  #             format.js { render :add_location }
  #           end
  #         end
  #       else
  #         # Handle the case where the location is not associated with the selected region
  #       end
  #     else
  #       # Handle the case where the location does not exist
  #     end
  #   else
  #     # Handle the case where the region does not exist
  #   end
  # end
  

  # def add_location
  #     @client = Client.find(params[:id])
  #     if !params[:location].blank?
  #       location = Location.find(params[:location].to_i)
  #       @client.locations << location
  #       @location = location
  #     end
  #     respond_to do |format|
  #       if @client.save
  #         format.js { render :add_location }
  #       end
  #     end
  # end


  def add_location
    @client = Client.find(params[:id])
    if params[:region].present? && Region.exists?(params[:region].to_i)
      region = Region.find(params[:region].to_i)
      @client.regions << region
    end
    respond_to do |format|
      if @client.save
        format.js { render :add_location }
      end
    end
  end

  # def add_location
  #   @client = Client.find(params[:id])
  #   if Region.exists?(params[:region].to_i)
  #     region = Region.find(params[:region].to_i)
  #     region.locations.each do |location|
  #       @client.locations << location
  #     end
  #   else
  #     # handle the case where the region doesn't exist
  #   end
  #   respond_to do |format|
  #     if @client.save
  #       format.js { render :add_location }
  #     end
  #   end
  # end



  # def add_location
  #   @client = Client.find(params[:id])
  #   location = Location.find(params[:location].to_i)
  #   @client.locations << location
  #   respond_to do |format|
  #     if @client.save
  #       format.js { render :add_location }
  #     end
  #   end
  # end
  
  # def add_location
  #   @client = Client.find(params[:id])
  #   @client.locations << @location
  #   if !params[:location].blank?
  #     location = Location.find(params[:location].to_i)
  #     @client.locations << location
  #   end
  #   respond_to do |format|
  #     if @client.save
  #       format.js { render :add_location }
  #     end
  #   end
  # end


  def locations_by_region
    @locations = Location.where("region_id = ?", params[:region_id])
    respond_to do |format|
      format.js 
    end
  end
  
  # def location_search
  #   if params[:region].present? && params[:region].strip != ""
  #     @locations = Location.where("region_id = ?", params[:region])
  #   else
  #     @locations = Location.all
  #   end
  # end

#   def add_region_and_locations
#     @client = Client.find(params[:id])
#     @regions = Region.all
#     region_ids = params[:region_ids]
#     @locations = Location.where(region_id: region_ids)
#   end

  

  # def add_region_and_locations
  #   @client = Client.find(params[:id])
  #   @regions = Region.all
  #   @locations = []
  #   if params[:region_id].present?
  #     @locations = Region.find(params[:region_id]).locations
  #   end
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  # def add_regions
  #   @client = Client.find(params[:id])
  #   region_ids = params[:region_ids]
  #   @regions = Region.where(id: region_ids)
  #   @client.regions << @regions
  #   @client.save
  #   respond_to do |format|
  #     format.html {redirect_to @client}
  #     format.js
  #   end
  # end


  # def locations_by_region
  #   @locations = Region.find(params[:region_ids]).map(&:locations).flatten
  #   respond_to do |format|
  #     format.js
  #   end
  # end


  
  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :user_id, hotel_branch_ids: [])
    end

    def room_params
      params.require(:room).permit(:name, :capacity, :price)
    end

    def room_facility_params
      params.require(:room_facility).permit(:name, :room_id, :room_facility_category_id)
    end

    def room_facility_category_params
      params.require(:room_facility_category).permit(:name)
    end
end
