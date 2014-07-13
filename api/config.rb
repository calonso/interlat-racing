
module Interlat
  class ConfigAPI < Grape::API
    format :json

    resources :config do
      
      desc "Returns a list of all connected users"
      get '/' do
        { cars_count: rand(1..5) }
      end

    end

  end
end