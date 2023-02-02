class RegionsController < ApplicationController

  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  # Display list of all regions
  def index
    @regions = Region.all.order('created_at ASC')
    @region = Region.new
  end

  # Display specific region details
  def show
  end

  # Create a new region
  def new
    @region = Region.new   
  end

  # Edit the existing region 
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # Save the new region to database 
  def create
    @region = Region.new(region_params)
    if @region.save
      respond_to do |format|
        format.html { redirect_to regions_path }
        format.js { redirect_to regions_path, :content_type => 'application/javascript' }
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end
  end
  
  # Update specific region details
  def update
    if @region.update(region_params)
      respond_to do |format|
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.js { render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end
  end

  # Deleting the existing region
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.js   { render }
    end
  end

  private

    # private method to find region with region_id
    def set_region
      @region = Region.find(params[:id])
    end

    # private method to pass region parameters for creating and updating regions
    def region_params
      params.require(:region).permit(:name, :client_id)
    end
    
end
