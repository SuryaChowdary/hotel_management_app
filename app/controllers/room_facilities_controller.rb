class RoomFacilitiesController < ApplicationController

  before_action :set_room_facility, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @room_facilities = RoomFacility.all
  end

  def show
  end

  def new
    @room_facility = RoomFacility.new
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @room_facility = RoomFacility.new(room_facility_params)

    if @room_facility.save
      redirect_to @room_facility, notice: 'Room facility was successfully created.'
    else
      render :new
    end
  end

  def update
    if @room_facility.update(room_facility_params)
      respond_to do |format|
        format.html { redirect_to @room_facility, notice: 'Location was successfully updated.' }
        format.js { render inline: "location_reload();"}
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js { render 'edit' }
      end
    end
  end

  def destroy
    @room_facility.destroy
    respond_to do |format|
      format.html { redirect_to room_facilities_url, notice: 'Location was successfully destroyed.' }
      format.js   { render }
    end
  end

  private
    def set_room_facility
      @room_facility = RoomFacility.find(params[:id])
    end

    def room_facility_params
      params.require(:room_facility).permit(:name, :room_facility_category_id, :room_id)
    end
end
