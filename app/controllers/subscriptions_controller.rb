class SubscriptionsController < ApplicationController

  def new
    @subscription = Subscription.new
    @user = User.find(params[:user_id])
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:email],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @user = User.find(params[:user_id])
    @user.stripe_token = customer.id
    @user.premium = true
    @user.save

    flash[:notice] = 'Thanks for going premium!'
    redirect_to :root


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_path
  end
end
