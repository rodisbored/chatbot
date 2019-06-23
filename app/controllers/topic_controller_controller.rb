class TopicControllerController < ApplicationController
  def index
    topics = Topics.where(group_id: params[:group_id])
    render json: topics
  end

  # The topic can be used to store broadcasted locations as well as user locations
  def create
    topic = Topic.find_or_create(topic_params)
    render json: topic
  end

  def update
    topic = Topic.update(topic_params)
    render json: topic
  end

  def subscribers
    user_ids = Subscription.where(topic_id: params[:id]).pluck(:user_id)
    subscribers = User.where(id: user_ids)
    # Definitely want to format this to make sure we don't expose sensitive user information
    render json: subscribers
  end

  private
  def topic_params
    params.require(:topic).permit(:name, :group_id)
  end
end
