require 'spec_helper'

describe Race do

  describe 'new race validations' do
    before { Fabricate(:race, date: Date.today, title: "The Florida Cup") }

    context 'for a race with the same date' do
      it 'is invalid with a matching title' do
        expect(Race.create(title: "The Florida Cup", date: Date.today).errors[:title].length).to eq(1)
      end

      it 'is invalid with a very similar title' do
        expect(Race.create(title: "florida cup", date: Date.today).errors[:title].length).to eq(1)
      end

      it 'is valid with a different title' do
        expect(Race.create(title: "Carolina Cup", date: Date.today).errors[:title].length).to eq(0)
      end
    end
  end

  describe '#full_address' do
    let(:race) { described_class.new(street: '123 awesome street', city: 'Atlanta', state: 'Georgia', country: '') }

    it 'returns a formatted address' do
      expect(race.full_address).to eq('123 awesome street, Atlanta, Georgia')
    end
  end
end
