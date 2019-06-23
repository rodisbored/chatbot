class SubscriptionControllerController < ApplicationController
  before_action :validate_user

  def index
    subscriptions = Subscription.joins(:topics).where(user_id: params[:user_id])
    # Should format this to really give users and topics
    render json: subscriptions
  end

  def create
    subscription = Subscription.find_or_create_by(subscription_params)
    render json: subscription
  end

  def destroy
    Subscription.destroy(params[:id])
    head :no_content
  end

  private
  def subscription_params
    params.require(:subscriptions).permit(:user_id, :topic_id)
  end
end
