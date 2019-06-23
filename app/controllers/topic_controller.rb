class TopicController < ApplicationController
  before_action :authorize_request

  # GET /groups/:group_id/topics
  def index
    topics = Topics.where(group_id: params[:group_id])
    render json: topics
  end

  # POST /groups/:group_id/topics
  def create
    topic = Topic.find_or_create(topic_params)
    render json: topic
  end

  # PUT /topics/:id
  def update
    topic = Topic.update(topic_params)
    render json: topic
  end

  # GET /topics/:topic_id/subscribers
  def subscribers
    user_ids = Subscription.where(topic_id: params[:id]).pluck(:user_id)
    subscribers = User.where(id: user_ids)
    # Definitely want to format this to make sure we don't expose sensitive user information
    render json: UserSerializer.new(subscribers)
  end

  private
  def topic_params
    params.require(:topic).permit(:name, :group_id)
  end
end
