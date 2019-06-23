class TopicChannel < ApplicationCable::Channel
  def subscribed
    subscription = Subscription.create(user_id: current_user.id, topic_id: params[:topic_id])
    stream_for subscription.topic
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
