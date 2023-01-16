class RegionsController < ApplicationController

  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @regions = Region.all.order('created_at ASC')
    @region = Region.new
  end

  def show
  end

  def new
    @region = Region.new   
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      respond_to do |format|
        format.html { redirect_to regions_path }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end
  end
  

  def update
    if @region.update(region_params)
      respond_to do |format|
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.js { render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js { render 'edit_errors' }
      end
    end
  end

  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.js   { render }
    end
  end

  private
    def set_region
      @region = Region.find(params[:region_id])
    end

    def region_params
      params.require(:region).permit(:name, :client_id)
    end
end
