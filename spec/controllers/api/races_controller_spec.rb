require 'spec_helper'

describe Api::RacesController do

  let(:race_stuff) do
    {
      title: 'AwesomeRace',
      date: '10/12/2015',
      city: 'Atlanta',
      state: 'Georgia',
      country: 'USA',
      url: 'http://thesupinstructor.com/'
    }
  end
  let(:race) { Race.last }

  it 'creates a new race' do
    post :create, race_stuff
    expect(race.title).to eq('AwesomeRace')
    expect(race.date).to eq('10/12/2015')
    expect(race.city).to eq('Atlanta')
    expect(race.state).to eq('Georgia')
    expect(race.country).to eq('USA')
    expect(race.url).to eq('http://thesupinstructor.com/')
  end
end
