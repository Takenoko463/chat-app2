class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    # side_barから送られてきたparams params
    @room = Room.find(params[:room_id])
    # message tableに保存すべきparams message_params
    @message = @room.messages.new(message_params)

    if @message.save
      redirect_to room_messages_path(@room)
    else
      # 失敗したら、indexアクションのpageへ
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
