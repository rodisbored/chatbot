class SubscriptionController < ApplicationController
  before_action :authorize_request

  # GET /users/:user_id/subscriptions
  def index
    subscriptions = Subscription.joins(:topics).where(user_id: params[:user_id])
    # Should format this to really give users and topics
    render json: subscriptions
  end

  # POST /users/:user_id/subscriptions
  def create
    subscription = Subscription.find_or_create_by(subscription_params)
    render json: subscription
  end

  # DELETE /users/:user_id/subscriptions/:id
  def destroy
    Subscription.destroy(params[:id])
    head :no_content
  end

  private
  def subscription_params
    params.require(:subscriptions).permit(:user_id, :topic_id)
  end
end
