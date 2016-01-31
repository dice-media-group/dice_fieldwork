require 'rails_helper'

RSpec.describe Consultation, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  let(:calendar) { create(:calendar) }
  let(:sales_rep) { create(:user, is_sales_rep: true) }
  let(:account) { create(:account) }
  let(:consultation) { build(:consultation, calendar_id: calendar.id, user_id: sales_rep.id, account_id: account.id) }
  # calendar = Calendar.create!( name: 'Sample Calendar', color: '#ffff00')
  it "has a valid factory" do
    expect(consultation).to be_valid
  end

  context "#name is blank" do
    let(:calendar) { create(:calendar) }
    let(:consultation) { build(:consultation, calendar_id: calendar.id, name: "") }
    it 'is invalid' do
      expect(consultation).to be_invalid
    end
  end

  context "#name is less than the minimum 3 characters" do
    let(:calendar) { create(:calendar) }
    let(:consultation) { build(:consultation, calendar_id: calendar.id, name: "du") }
    it 'is invalid' do
      expect(consultation).to be_invalid
    end
  end

  context "#calendar_id is nil" do
    let(:calendar) { create(:calendar) }
    let(:consultation) { build(:consultation, calendar_id: nil) }
    it 'is invalid' do
      expect(consultation).to be_invalid
    end
  end

  context "#from_date is blank" do
    let(:calendar) { create(:calendar) }
    let(:consultation) { build(:consultation, calendar_id: calendar.id, from_date: "") }
    it 'is invalid' do
      expect(consultation).to be_invalid
    end
  end

  context "#to_date is blank" do
    let(:calendar) { create(:calendar) }
    let(:consultation) { build(:consultation, calendar_id: calendar.id, to_date: "") }
    it 'is invalid' do
      expect(consultation).to be_invalid
    end
  end

  context "#time_zone is blank" do
    let(:calendar) { create(:calendar) }
    let(:consultation) { build(:consultation, calendar_id: calendar.id, time_zone: "") }
    it 'is invalid' do
      expect(consultation).to be_invalid
    end
  end

  describe '#not_all_day validations' do
    let(:calendar) { create(:calendar) }
    context 'if the consultation is not all day and #from_time is blank' do
      let(:consultation) { build(:consultation, calendar_id: calendar.id, from_time: "") }
      it 'expects to be invalid' do
        expect(consultation).to be_invalid
      end
    end
    context 'if the consultation is not all day and #to_time is blank' do
      let(:consultation) { build(:consultation, calendar_id: calendar.id, to_time: "") }
      it 'expects to be invalid' do
        expect(consultation).to be_invalid
      end
    end
  end

end
