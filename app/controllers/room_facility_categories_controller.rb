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
      respond_to do |format|
        format.html { redirect_to room_facility_categories_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
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
        format.js { render 'edit_errors' }
      end
    end
  end

  def destroy

    @room_facility_category.destroy
    respond_to do |format|
      format.html { redirect_to room_facility_categories_url, notice: 'Location was successfully destroyed.' }
      format.js { render }
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
