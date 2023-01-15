class PagesController < ApplicationController

  def home
  end

  def about
  end

  class PagesController < ApplicationController
    def new_nested_form
      @client = Client.all
      @client.hotel_branches.build
      @client.hotel_branches.first.rooms.build
      @client.hotel_branches.first.rooms.first.room_facilities.build
    end
  
    def create
      @client = current_user.clients.build(client_params)
      if @client.save
        redirect_to @client, notice: 'Client was successfully created.'
      else
        render :new_nested_form
      end
    end
  
    private
    
    def client_params
      params.require(:client).permit(:name, hotel_branches_attributes: [:name, :address, :city, :state, :phone, :website, rooms_attributes: [:name, :capacity, :price, room_facilities_attributes: [:name, :room_facility_category_id]]])
    end
  end
  
    
end