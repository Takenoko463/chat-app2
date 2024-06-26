class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    # main_chatから送られてきたparams params
    @room = Room.find(params[:room_id])
    # message tableに保存すべきparams message_params
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      # 失敗したら、indexアクションのpageへ
      @messages = @room.messages.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
