class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @rooms = Room.all.order('created_at ASC')
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      respond_to do|format|
        format.html {redirect_to rooms_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  def update
    if @room.update(room_params)
      respond_to do |format|
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'edit_errors' }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.js   { render }
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :capacity, :price, :hotel_branch_id)
    end
end
