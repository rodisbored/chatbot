class Message < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  after_commit { TopicMessageRelayJob.perform_later(self) }
end
