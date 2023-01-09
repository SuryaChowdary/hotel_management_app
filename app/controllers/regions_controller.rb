class RegionsController < ApplicationController

  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @region = Region.all.order('created_at ASC')
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
      flash[:notice] = "Region is added Successfully"
      redirect_to regions_path(@region)
    else
      render 'new'
    end
  end

  def update
    if @region.update(region_params)
      respond_to do |format|
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
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
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.js   { render }
    end
  end

  private
    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:name, :client_id)
    end
end
