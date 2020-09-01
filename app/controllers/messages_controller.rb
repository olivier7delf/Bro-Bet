class MessagesController < ApplicationController



  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @bet = @chatroom.bet

    if @bet

      if @message.save
        ChatroomChannel.broadcast_to(
          @chatroom,
          render_to_string(partial: "message", locals: { message: @message })
        )
        redirect_to bet_path(@bet)
      else
        render "bets/show"
      end
    else
      @tournament = @chatroom.tournament
      if @message.save
        ChatroomChannel.broadcast_to(
          @chatroom,
          render_to_string(partial: "message", locals: { message: @message })
        )
        redirect_to tournament_path(@tournament)
      else
        render "tournaments/show"
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
