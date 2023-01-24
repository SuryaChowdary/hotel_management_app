class RoomFacilitiesController < ApplicationController

  before_action :set_room_facility, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  # Display the list of room facilities
  def index
    @room_facilities = RoomFacility.all.order('created_at ASC')
  end

  # Display details of specific room facility
  def show
  end

  # Create a new room facility
  def new
    @room_facility = RoomFacility.new
  end

  # Edit the details of specific room facility
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # Save room facility to database
  def create
    @room_facility = RoomFacility.new(room_facility_params)
    if @room_facility.save
      respond_to do |format|
        format.html { redirect_to room_facilities_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end
  end

  # Updating specific room facility details
  def update
    if @room_facility.update(room_facility_params)
      respond_to do |format|
        format.html { redirect_to @room_facility, notice: 'Location was successfully updated.' }
        format.js { render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end
  end

  # Delete a specific room facility 
  def destroy
    @room_facility.destroy
    respond_to do |format|
      format.html { redirect_to room_facilities_url, notice: 'Location was successfully destroyed.' }
      format.js   { render }
    end
  end

  private

    # private method to find room facility with room_facility_id
    def set_room_facility
      @room_facility = RoomFacility.find(params[:id])
    end

    # private method to pass room facility parameters for creating and updating room facilities  
    def room_facility_params
      params.require(:room_facility).permit(:name, :room_facility_category_id, :room_id)
    end
end
