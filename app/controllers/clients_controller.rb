class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @client = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = "Client details are added successfully"
      redirect_to clients_path(@client) 
    else
      render 'new'
    end
  end

  def update
    if @client.update(client_params)
      flash[:notice] = "Client details are edited successfully"
      redirect_to clients_path(@client)
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    flash[:notice] = "Client is removed successfully"
    redirect_to clients_path
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :user_id)
    end
end
