require 'spec_helper'
require './app'
require 'rack/test'

RSpec.describe OwnlocalAPI do
  include Rack::Test::Methods

  def app
    OwnlocalAPI
  end

  describe 'GET /businesses', elasticsearch: true do
    it "returns all businesses" do
      business = create(:business)

      get '/businesses'

      expect(last_response.body).to include(business.name)
    end

    it "paginates businesses" do
      business1 = create(:business)
      business2 = create(:business, name: '2nd business!')

      get '/businesses', { page: 2, per_page: 1 }

      expect(last_response.body).to_not include(business1.name)
      expect(last_response.body).to include(business2.name)
    end
  end

  describe 'GET /businesses/:id' do
    it "returns business with valid id" do
      business = create(:business)

      get "/businesses/#{business.id}"

      expect(last_response.body).to include(business.name)
      expect(last_response.status).to eq(200)
    end

    context 'with invalid id' do
      it 'returns 404' do
        business = create(:business)

        get '/businesses/invalid'

        expect(last_response.body).to include('Business not found')
        expect(last_response.status).to eq(404)
      end
    end

    context 'when id does not exist in database' do
      it 'returns 404' do
        business = create(:business)

        get '/businesses/invalid'

        expect(last_response.body).to include('Business not found')
        expect(last_response.status).to eq(404)
      end
    end
  end
end
