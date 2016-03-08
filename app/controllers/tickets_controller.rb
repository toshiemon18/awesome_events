class TicketsController < ApplicationController
  def new
    raise ActionController::RoutingError, "ログイン状態でTicketsController#newにアクセス"
  end

  def create 
    ticket = current_user.tickets.build do |t|
      t.event_id = params[:event_id]
      t.comment = params[:ticket][:comment]
    end

    if ticket.save
      flash[:notice] = "このイベントに参加しました"
      head 210
    else 
      render json: { messages: ticket.errors.full_messages }, status: 422
    end
  end
end
