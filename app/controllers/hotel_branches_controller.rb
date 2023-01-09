class HotelBranchesController < ApplicationController

  before_action :require_user
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def index
    @hotel = HotelBranch.all.order('created_at ASC')
  end

  def show
  end
  
  def new
    @hotel = HotelBranch.new
  end

  def create
    @hotel = HotelBranch.new(hotel_params)
    if @hotel.save
      flash[:notice] = "Hotel Branch was added successfully"
      redirect_to hotel_branches_path(@hotel)
    else
      render 'new'
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @hotel.update(hotel_params)
      respond_to do |format|
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js { render 'edit' }
      end
    end
  end

  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotel_branches_path, notice: 'Hotel was successfully destroyed.' }
      format.js   { render }
    end
  end

  private 

  def set_hotel
    @hotel = HotelBranch.find(params[:id])
  end

  def hotel_params
    params.require(:hotel_branch).permit(:name, :address, :city, :state, :country, :phone, :website, :location_id, :client_id)
  end

end