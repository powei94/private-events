class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def show
      @event = Event.find(params[:id])
  end

  def index
      @past_events = Event.all.past
      @future_events = Event.all.future
  end

  def new
      @event = Event.new
  end

  def create
      @event = Event.new(event_params)
      @event.creator_id = current_user.id
  
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

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Evento actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Evento eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :start_time)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end