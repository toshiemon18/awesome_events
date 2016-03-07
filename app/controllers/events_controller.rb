class EventsController < ApplicationController
  before_action :authenticate, except: :show

  def new 
    @event = current_user.created_events.build
  end

  def create 
    @event = current_user.created_events.build(event_params)

    if @event.save then 
      redirect_to @event, notice: "イベントを作成しました"
    else 
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit 
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event.update(event_params) then 
      redirect_to @event, notice: "イベント情報を更新しました"
    else 
      render :edit
    end
  end

  private 
  
  def event_params
    params.require(:event).permit( 
      :name, :place, :content, :start_time, :end_time
    )
  end

end
