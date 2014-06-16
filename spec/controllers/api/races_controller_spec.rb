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
end
