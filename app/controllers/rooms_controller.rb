class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  # Display a list of all rooms
  def index
    @rooms = Room.all.order('created_at ASC')
  end

  # Display a specific room details
  def show
  end

  # Create a new room
  def new
    @room = Room.new
  end

  # Edit specific room details
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # Save room details to database 
  def create
    @room = Room.new(room_params)
    if @room.save
      roomId = @room.id
      respond_to do|format|
        format.html {redirect_to rooms_path}
        format.js {redirect_to rooms_url, :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  # Update specific room details
  def update
    if @room.update(room_params)
      respond_to do |format|
        format.html { redirect_to rooms_path, notice: 'Room was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end
  end

  # Delete a specific room 
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.js   { render }
    end
  end

  private

    # private method to find room with room_id
    def set_room
      @room = Room.find(params[:id])
    end

    # private method to pass room parameters for creating a updating rooms
    def room_params
      params.require(:room).permit(:name, :capacity, :price, :hotel_branch_id)
    end
end
