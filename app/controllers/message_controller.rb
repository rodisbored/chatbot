class MessageController < ApplicationController
  before_action :authorize_request

  MAX_EDIT_PERIOD = 30.seconds

  # GET /topics/:topic_id/messages
  def index
    messages = Message.where(topic_id: params[:topic_id])
    render json: messages
  end

  # POST /topics/:topic_id/messages
  def create
    message = Message.create(message_params)
    render json: message
  end

  # PUT /messages/:id
  # Allow updates to the message if the message is not older than MAX_EDIT_PERIOD
  def update
    message = Message.find_by(params[:id])
    if message.nil?
      render_error("message with id #{params[:id]} does not exist", :not_found)
    elsif message.created_at < Time.now.utc - MAX_EDIT_PERIOD
      render_error("cannot update message more than #{MAX_EDIT_PERIOD} seconds old", :forbidden)
    else
      render json: message.update(message_params)
    end
  end

  # DELETE /messages/:id
  def destroy
    Message.destroy(params[:id])
    head :no_content
  end

  private
  def message_params
    params.require(:message).permit(:topic_id, :content, :user_id)
  end
end
