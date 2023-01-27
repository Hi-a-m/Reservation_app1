class RoomsController < ApplicationController

  def index   #rooms GET    /rooms
    @rooms = Room.all   #allメソッドはroomsテーブルのレコードを全て取得できるメソッド
    @user = current_user
  end

  def show    #room GET    /rooms/:id
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new   #new_room GET    /rooms/new
    @user = current_user
    @room = Room.new #これからデータを作成するという宣言
  end

  def create   #POST   /rooms
      @user = current_user
      @room = Room.new(room_params) #paramsの中に登録したいデータを入れ込む
      if @room.save
        flash[:notice] = "ルームを登録しました"
        redirect_to room_path(@room)
      else
          flash[:alert] = "ルーム情報を登録できませんでした"
          render "new"
      end
  end

  def search   #search_rooms GET    /rooms/search
    @user = current_user
    @results = @q.result
  end

  def edit   #edit_room GET    /rooms/:id/edit
    @room = Room.find(params[:id])
  end

  def update   #PATCH  /rooms/:id
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :introduction, :price, :image))
       flash[:notice] = "情報を更新しました"
       redirect_to :rooms
    else
       render "edit"
    end
  end

  def destroy   #DELETE /rooms/:id
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  
  def room_params
    params.require(:room).permit(:room_name, :introduction, :price, :address, :image)
  end

end
