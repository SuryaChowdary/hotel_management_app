class RoomFacilitiesController < ApplicationController

  before_action :set_room_facility, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @room_facilities = RoomFacility.all.order('created_at ASC')
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

  def update
    if @room_facility.update(room_facility_params)
      respond_to do |format|
        format.html { redirect_to @room_facility, notice: 'Location was successfully updated.' }
        format.js { render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js { render 'edit_errors' }
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
