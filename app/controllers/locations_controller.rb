class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @location = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
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
      flash[:notice] = "Location details are updated successfully"
      redirect_to locations_path(@location)
    else
      render 'edit'
    end
  end

  def destroy
    @location.destroy
    flash[:notice] = "Location is deleted successfully"
    redirect_to locations_path
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:country, :region_id)
    end
end
