module Spree

  Order.class_eval do

    def cash_on_delivery?
      payments.where(state: ['checkout', 'pending']).map { |m| m.payment_method.type }.include? "Spree::PaymentMethod::CashOnDelivery"
    end

  end

end

