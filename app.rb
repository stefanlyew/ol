require './config/environment.rb'
require "sinatra/json"
require './models/business.rb'

class OwnlocalAPI < Sinatra::Base
  register Kaminari::Helpers::SinatraHelpers

  get "/" do
    redirect to('/businesses')
  end

  # /businesses?page=2&per_page=25
  get "/businesses" do
    content_type :json
    businesses = Business.page(params[:page]).per(params[:per_page]).order(:id)

    response = {
                  businesses: businesses,
                  page: businesses.current_page,
                  per_page: businesses.limit_value
               }
    json response
  end

  get "/businesses/:id" do
    content_type :json

    if is_number?(params[:id]) && Business.find_by_id(params[:id])
      response = Business.find_by_id(params[:id])
    else
      status 404
      response = { error: "Business not found" }
    end

    json response
  end

  def is_number?(obj)
    obj.to_s == obj.to_i.to_s
  end

end
