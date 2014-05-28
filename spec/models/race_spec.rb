require 'spec_helper'

describe Race do

  describe '#full_address' do
    let(:race) { described_class.new(street: '123 awesome street', city: 'Atlanta', state: 'Georgia', country: '') }

    it 'returns a formatted address' do
      expect(race.full_address).to eq('123 awesome street, Atlanta, Georgia')
    end
  end
end
