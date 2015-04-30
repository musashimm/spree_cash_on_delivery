require 'spec_helper'

describe Spree::Shipment do

  describe "#determine_state" do

    let(:shipment) { create(:shipment) }
    let(:order) { shipment.order }

    before(:each) do
      order.state = "complete"
    end

    it "returns pending state if order has not cash on delivery payments" do
        payment_method = create(:check_payment_method)
        order.payments.create!(:amount => order.total, :payment_method => payment_method)
        expect(shipment.determine_state(order)).to eq "pending"
    end

    it "returns ready state if order has cash on delivery payments" do
        payment_method = create(:cash_on_delivery_paymant_method)
        order.payments.create!(:amount => order.total, :payment_method => payment_method)
        expect(shipment.determine_state(order)).to eq "ready"
    end

  end

end
