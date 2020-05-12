class AttendancesController < ApplicationController

    def create
        event = Event.find(attendance_params[:event_id])
        attendance = Attendance.new(user: current_user, event: event)
        if attendance.save
            redirect_to event
        else
            redirect_to root_path
        end
    end

    private

    def attendance_params
        params.permit(:event_id)
    end
end
