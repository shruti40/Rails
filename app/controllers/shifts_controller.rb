class ShiftsController < ApplicationController

    def new
        @shift = Shift.new()
    end

    def index
        @teams = Team.all
        @shifts = Shift.all
    end

    def create
        @shift = Shift.new(shift_params)
        if @shift.save
            UserNotifierMailer.send_shift_creation_email.deliver
            redirect_to '/teams'
        else
            redirect_to '/'
        end
    end

    def update
    end

    def destroy
        
    end

    private

    def shift_params
        params.require(:shift).permit(:id, :name, :week_day, :start_time, :end_time, :team_id, :user_id)
    end
    
end
