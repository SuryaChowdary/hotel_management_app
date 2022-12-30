class RegionsController < ApplicationController

  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @region = Region.all
  end

  def show
  end

  def new
    @region = Region.new
  end

  def edit
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
      flash[:notice] = "Region details are updated successfully"
      redirect_to regions_path(@region)
    else
      render 'edit'
    end
  end

  def destroy
    @region.destroy
    flash[:notice] = "Region is deleted successfully"
    redirect_to regions_path
  end

  private
    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:name, :client_id)
    end
end
