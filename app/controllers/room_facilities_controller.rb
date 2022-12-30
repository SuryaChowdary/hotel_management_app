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
      redirect_to @room_facility, notice: 'Room facility was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room_facility.destroy
    redirect_to room_facilities_url, notice: 'Room facility was successfully destroyed.'
  end

  private
    def set_room_facility
      @room_facility = RoomFacility.find(params[:id])
    end

    def room_facility_params
      params.require(:room_facility).permit(:name, :room_facility_category_id, :room_id)
    end
end
