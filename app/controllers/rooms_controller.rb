class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @rooms = Room.all.order(:id)
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def new
    @rooms = Room.all.order(:id)
    @room = Room.new
  end

  def create
    @rooms = Room.all.order(:id)
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = 'トークルーム作成に成功しました'
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

def destroy
  @room = Room.find(params[:id])
  if current_user.id == @room.user_id
    @room.destroy
    flash[:notice] = 'トークルームを削除しました'
    redirect_to rooms_path
  else
    flash[:notice] = '削除できません'
    redirect_to rooms_path
  end
end

  def search
    @rooms = Room.search(params[:keyword])
    @talk_room = Room.all
  end

  def time_show
    @day_params = params[:format]
    @rooms = Room.all.order(:id)
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
