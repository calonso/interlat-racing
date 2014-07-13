
module Interlat
  class ConfigAPI < Grape::API
    format :json

    before do
      header "Access-Control-Allow-Origin", "*"
    end

    resources :config do
      
      desc "Returns a list of all connected users"
      get '/' do
        { cars_count: rand(2..5) }
      end

    end

  end
end