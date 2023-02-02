class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  # Display list of all locations 
  def index
    @locations = Location.all.order('created_at ASC')
    @location = Location.new
  end

  # Show specific location details 
  def show
  end

  # Create a new location
  def new
    @location = Location.new
  end

  # Editing the existing location  
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # Save the new location to database
  def create
    @location = Location.new(location_params)
    if @location.save
      respond_to do |format|
        format.html { redirect_to locations_path }
        format.js { redirect_to locations_path, :content_type => 'application/javascript' }
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end
  end

  # Updating the existing location details
  def update
    if @location.update(location_params)
      respond_to do |format|
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.js { render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end
  end

  # Deleting specific location from database 
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.js   { render }
    end
  end
  

  private

    # private method to find specific location by location_id
    def set_location
      @location = Location.find(params[:id])
    end
      
    # private method to pass location parameters for creating and updating locations
    def location_params
      params.require(:location).permit(:name, :region_id)
    end
    
end
