class TopicMessageRelayJob < ApplicationJob
  def perform(comment)
    TopicChannel.broadcast_to(comment.topic, comment.content)
  end
end
