require './config/environment'

class Business < ActiveRecord::Base
  paginates_per 50
end
