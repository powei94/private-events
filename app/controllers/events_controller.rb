class EventsController < ApplicationController

    def show
        @event = Event.find(params[:id])
    end

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        @event.user_id = current_user.id
    
        respond_to do |format|
          if @event.save
            format.html { redirect_to @event, notice: 'Evento creado exitosamente.' }
            format.json { render :show, status: :created, location: @event }
          else
            format.html { render :new }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
    end
end