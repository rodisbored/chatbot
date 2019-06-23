class Message < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  before_validation :find_or_create_topic
  after_commit { TopicMessageRelayJob.perform_later(self) }

  def find_or_create_topic
    Topic.find_or_create
  end
end
