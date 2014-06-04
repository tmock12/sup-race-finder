require 'spec_helper'

describe RacesController do
  before { described_class.skip_before_filter(:require_user) }

  describe '#update' do
    let(:race) { Fabricate(:race) }
    let(:race_params) do
      {
        title: 'Race for the monkeys',
        street: '1234 Monkey Way',
        city: 'Monkey Town',
        state: 'Georgia',
        country: 'USA',
        zip: '30328',
        url: 'www.monkeyhelpers.com',
        description: 'help the monkeys'
      }
    end

    it 'Updates the race with provided params' do
      put :update, id: race.token, race: race_params
      race.reload
      race_params.each do | k, v |
        expect(race.send(k)).to eq(v)
      end
    end
  end

  describe '#destroy' do
    before { Fabricate.times(2, :race) }
    let!(:race) { Fabricate(:race) }
    it 'destroys a race' do
      expect{ delete :destroy, id: race.token }.to change{Race.count}.by(-1)
    end
  end
end
