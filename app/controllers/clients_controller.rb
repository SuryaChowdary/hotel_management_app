class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @clients = Client.all.order('created_at ASC')
    @client = Client.new

  end

  def show
    @hotel = HotelBranch.new

  end

  def new
    @client = Client.new
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end


  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id
    if @client.save
      respond_to do |format|
        format.html { redirect_to clients_path }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js {render 'errors'}
      end
    end
  end

  def update
    if @client.update(client_params)
      respond_to do |format|
        format.html { redirect_to @client }
        format.js { render :content_type => 'application/javascript'}
      end
    else
      respond_to do |format|
        format.js 
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url  }
      format.js   { render }
    end
  end

  def add_hotels
    @client = Client.find(params[:id])
    hotel_branch_ids = params[:hotel_branch_ids]
    @hotel_branches = HotelBranch.where(id: hotel_branch_ids)
    @client.hotel_branches << @hotel_branches
    @client.save
    respond_to do |format|
      format.html {redirect_to @client}
      format.js
    end
  end
  
  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :user_id, hotel_branch_ids: [])
    end
end
