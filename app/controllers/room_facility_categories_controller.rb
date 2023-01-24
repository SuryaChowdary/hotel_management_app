class RoomFacilityCategoriesController < ApplicationController
  before_action :require_user
  before_action :set_room_facility_category, only: [:show, :edit, :update, :destroy]

  # Display list of all room facility categories 
  def index
    @room_facility_categories = RoomFacilityCategory.all.order('created_at ASC')
  end

  # Show the details of specific room facility category
  def show
  end

  # Create a new room facility category
  def new
    @room_facility_category = RoomFacilityCategory.new
  end

  # Save room facility category to database
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

  # Edit specific room facility category
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # Updating specific room facility category details to database 
  def update
    if @room_facility_category.update(room_facility_category_params)
      respond_to do |format|
        format.html { redirect_to @room_facility_category }
        format.js { render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end
  end

  # Delete a specific room facility category 
  def destroy
    @room_facility_category.destroy
    respond_to do |format|
      format.html { redirect_to room_facility_categories_url, notice: 'Location was successfully destroyed.' }
      format.js { render }
    end
    
  end

  private

  # private method to find a room facility category with it's id 
  def set_room_facility_category
    @room_facility_category = RoomFacilityCategory.find(params[:id])
  end
  
  # private method to pass room facility category parameters for creating and updating room_facility_category details 
  def room_facility_category_params
    params.require(:room_facility_category).permit(:name)
  end
  
end
