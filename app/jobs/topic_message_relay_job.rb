class TopicMessageRelayJob < ApplicationJob
  def perform(comment)
    TopicChannel.broadcast_to(comment.topic, comment.content)
    # ActionCable.server.broadcast "messages:#{comment.message_id}:comments",
    #                              comment: CommentsController.render(partial: 'comments/comment', locals: { comment: comment })
  end
end
