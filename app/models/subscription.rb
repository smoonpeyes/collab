class Subscription < ActiveRecord::Base
  belongs_to user
  validates_presence_of :email
  attr_accessible :email, :stripe_customer_token

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description:email,
                                        card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
