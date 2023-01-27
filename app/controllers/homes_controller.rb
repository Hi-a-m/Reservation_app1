class HomesController < ApplicationController

    def top
        @user = current_user
        @all_rooms = Room.all
        @q = Room.ransack(params[:q]) #検索フォームの条件、入力した値(params[:q])を元に、roomsテーブルからデータを検索します。
        

    end

    def index
        @user = current_user
        @all_rooms = Room.all
        @q = Room.ransack(params[:q])
        @results = @q.result
    end

    def new
    end

    def create
    end

    def search
        @results = @q.result #ransack用
        @user = current_user
    end

    private
    
    def set_q
      @q = Room.ransack(params[:q])
    end
  
end