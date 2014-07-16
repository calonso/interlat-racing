
module Interlat
  class RankingAPI < Grape::API
    format :json

    resources :ranking do

      desc "Stores a the results of a new race of the Interlat World Championship"
      params do
        requires :ranking, type: Array, desc: "Array with the car numbers in the order they finished the race"
      end
      post '/' do
        Ranking.update_with_ranking params[:ranking]
      end

      desc "Retrieves the ranking information to build a ranking"
      get '/' do
        Ranking.get_ranking
      end
    end

  end
end