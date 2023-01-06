class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @location = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = "Location is added Successfully"
      redirect_to locations_path(@location)
    else
      render 'new'
    end
  end

  def update
    if @location.update(location_params)
      respond_to do |format|
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
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
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.js   { render }
    end
  end
  

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:country, :region_id)
    end
end
