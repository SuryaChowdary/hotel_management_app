class HotelBranchesController < ApplicationController

  def index
    @hotel = HotelBranch.all
  end

  def show
    @hotel = HotelBranch.find(params[:id])
  end
  
  def new
    @hotel = HotelBranch.new
  end

  def create
    @hotel = HotelBranch.new(params.require(:hotel_branch).permit(:name, :address, :city, :state, :country, :phone, :website))
    if @hotel.save
      flash[:notice] = "Hotel Branch was added successfully"
      redirect_to hotel_branches_path(@hotel)
    else
      render 'new'
    end
  end

  def edit
    @hotel = HotelBranch.find(params[:id])
  end

  def update
    @hotel = HotelBranch.find(params[:id])
    if @hotel.update(params.require(:hotel_branch).permit(:name, :address, :city, :state, :country, :phone, :website))
      flash[:notice] = "Hotel details are edited Successfully"
      redirect_to hotel_branches_path(@hotel)
    else
      render 'edit'
    end
  end

  def destroy
    @hotel = HotelBranch.find(params[:id])
    if @hotel.destroy
      flash[:notice] = "Hotel was deleted successfully"
      redirect_to hotel_branches_path
    end
  end

end