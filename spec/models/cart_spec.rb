require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @cart         = create(:cart)
    #   @mow_lawn     = create(:service)
  end
  context 'when services are unique' do
    let(:first_service) { create(:service) }
    let(:second_service) { create(:service, name: "super #{first_service.name}") }
    it 'the cart is valid' do
      @cart.add_service(first_service.id).save!
      @cart.add_service(second_service.id).save!
      # expect(@cart.line_items.size).to eq(2)
      expect(@cart).to have(2).line_items
    end

    context 'when a duplicate product is added' do
      let(:first_service) { create(:service, price: 1.22) }
      it 'has only one line item' do
        @cart.add_service(first_service.id).save!
        @cart.add_service(first_service.id).save!
        expect(@cart).to have(1).line_items
      end
      
      it 'doubles the price of the service' do
        @cart.add_service(first_service.id).save!
        @cart.add_service(first_service.id).save!
        expect(@cart.total_price).to eq(2.44)
      end
      
      it 'has doubles the quantity of the first line item' do
        @cart.add_service(first_service.id).save!
        @cart.add_service(first_service.id).save!
        expect(@cart.line_items[0].quantity).to eq(2)
      end
    end
  end
end
