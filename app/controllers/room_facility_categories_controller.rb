class RoomFacilityCategoriesController < ApplicationController
  before_action :require_user
  before_action :set_room_facility_category, only: [:show, :edit, :update, :destroy]

  
  def index
    @room_facility_categories = RoomFacilityCategory.all.order('created_at ASC')
  end

  def show

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
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @room_facility_category.update(room_facility_category_params)
      respond_to do |format|
        format.html { redirect_to @room_facility_category }
        format.js { render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js { render 'edit' }
      end
    end
  end

  def destroy
    @room_facility_category.destroy
    flash[:alert] = "Category is deleted successfully"
    respond_to do |format|
      format.html { redirect_to room_facility_categories_url }
      format.js   { render }
    end
  end

  private

  def set_room_facility_category
    @room_facility_category = RoomFacilityCategory.find(params[:id])
  end
  
  def room_facility_category_params
    params.require(:room_facility_category).permit(:name)
  end
end
