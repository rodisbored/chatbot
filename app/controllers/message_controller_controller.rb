class MessageControllerController < ApplicationController
  MAX_EDIT_PERIOD = 30.seconds

  def index
    messages = Message.where(topic_id: params[:topic_id])
    render json: messages
  end

  def create
    message = Message.create(message_params)
    render json: message
  end

  # Allow updates to the message if the message is not older than MAX_EDIT_PERIOD
  def update
    message = Message.find_by(params[:id])
    if message.created_at < Time.now.utc - MAX_EDIT_PERIOD
      render_error("cannot update message more than #{MAX_EDIT_PERIOD} seconds old", 403)
    else
      render json: message.update(message_params)
    end
  end

  private
  def message_params
    params.require(:message).permit(:topic_id, :content, :user_id)
  end
end
