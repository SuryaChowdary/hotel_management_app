class RoomFacilityCategoriesController < ApplicationController
  before_action :require_user
  
  def index
    @room_facility_categories = RoomFacilityCategory.all
  end

  def show
    @room_facility_category = RoomFacilityCategory.find(params[:id])
  end

  def new
    @room_facility_category = RoomFacilityCategory.new
  end

  def create
    @room_facility_category = RoomFacilityCategory.new(room_facility_category_params)

    if @room_facility_category.save
      redirect_to @room_facility_category, notice: 'Room facility category was successfully created.'
    else
      render :new
    end
  end

  def edit
    @room_facility_category = RoomFacilityCategory.find(params[:id])
  end

  def update
    @room_facility_category = RoomFacilityCategory.find(params[:id])
    if @room_facility_category.update(room_facility_category_params)
      redirect_to @room_facility_category, notice: 'Room facility category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room_facility_category = RoomFacilityCategory.find(params[:id])
    @room_facility_category.destroy
    redirect_to room_facility_categories_url, notice: 'Room facility category was successfully destroyed.'
  end

  private

  def room_facility_category_params
    params.require(:room_facility_category).permit(:name)
  end
end
