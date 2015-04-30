FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_cash_on_delivery/factories'
  factory :cash_on_delivery_paymant_method, class: Spree::PaymentMethod::CashOnDelivery do
    name 'Cash On Delivery'
  end
end
