class ApplicationController < ActionController::Base
    def create
        a = Attendance.new(user: current_user, event: event.find(params[:event_id]))
        a.save
    end
end
