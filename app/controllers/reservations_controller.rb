class ReservationsController < ApplicationController
    def index
        @user = current_user
        @reservations = Reservation.all
        @rooms = Room.all
    end
  
     #new_reservation GET    /reservations/new
    def new
        @user = current_user
        @rooms = Room.all
        @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :user_id, :total_price, :total_day))
        @room = Room.find(params[:reservation][:room_id])
        
    end
  
    def create
        @user = current_user
        @rooms = Room.all
        @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :user_id, :total_price, :total_day))
        if @reservation.save
            flash[:notice] = "予約が完了しました"
            redirect_to action: :index
        end
    end
  
    def show #reservation GET    /reservations/:id
    end

    def edit #edit_reservation GET    /reservations/:id
    end

    def update
    end

    def destroy #DELETE /reservations/:id
    end

end