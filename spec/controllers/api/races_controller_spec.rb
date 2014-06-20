require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Races" do

  post '/api/races' do
    let(:raw_post) do
      {
        race: {
          title: 'AwesomeRace',
          date: 'December 10 2015',
          city: 'Atlanta',
          state: 'Georgia',
          country: 'USA',
          url: 'http://thesupinstructor.com/',
          email: 'chase@bicsup.com'
        }
      }.to_json
    end

    example 'Create a Race' do
      header "Content-Type", "application/json"
      authorized_user!

      do_request

      expect(status).to eq(201)
      expect(JSON.parse(response_body)).to eq(
        { race:
        {
          title: 'AwesomeRace',
          date: 'Dec 10, 2015',
          city: 'Atlanta',
          state: 'Georgia',
          country: 'USA',
          url: 'http://thesupinstructor.com/',
          email: 'chase@bicsup.com'
        }.stringify_keys
      }.stringify_keys
      )
    end

    example 'Create a Race without a user api token', document: false do
      do_request

      expect(status).to eq(401)
    end
  end

  get '/api/races' do
    parameter :start_date, "Start Date"
    parameter :end_date, "End Date"

    before do
      Timecop.freeze(Chronic.parse("May 10 2015"))
      Fabricate(:active_race) do
        title 'Molkai'
        date Chronic.parse("June 6 2015")
        city 'Molokai'
        state 'Hawaii'
        country 'USA'
        url 'http://www.molokai2oahu.com/'
        email 'shannon@molokai2oahu.com'
      end
      Fabricate(:active_race) do
        title 'Lost Mills'
        date Chronic.parse("August 10 2015")
        city 'Brombachsee'
        state ''
        country 'Germany'
        url 'http://thelostmills.com/'
        email 'info@lostmills.com'
      end
    end
    after do
      Timecop.return
    end

    example 'Get all races returns 1 year of races from today by default' do
      header "Content-Type", "application/json"
      authorized_user!

      do_request

      expect(JSON.parse(response_body)).to eq(
        { races: [
          {
            title: 'Molkai',
            date: 'Jun 06, 2015',
            city: 'Molokai',
            state: 'Hawaii',
            country: 'USA',
            url: 'http://www.molokai2oahu.com/',
            email: 'shannon@molokai2oahu.com'
          }.stringify_keys,
          {
            title: 'Lost Mills',
            date: 'Aug 10, 2015',
            city: 'Brombachsee',
            state: '',
            country: 'Germany',
            url: 'http://thelostmills.com/',
            email: 'info@lostmills.com'
          }.stringify_keys]
        }.stringify_keys
      )
    end

    example 'Get races without a user api token', document: false do
      do_request

      expect(status).to eq(401)
    end

    example 'Get races filtered by dates' do
      authorized_user!

      do_request(start_date: 'Jun 1, 2015', end_date: 'Jun 20, 2015')

      expect(JSON.parse(response_body)).to eq(
        { races: [
          {
            title: 'Molkai',
            date: 'Jun 06, 2015',
            city: 'Molokai',
            state: 'Hawaii',
            country: 'USA',
            url: 'http://www.molokai2oahu.com/',
            email: 'shannon@molokai2oahu.com'
          }.stringify_keys
        ]
        }.stringify_keys
      )
    end

  end
end
