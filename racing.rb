
require 'bundler/setup'
Bundler.require :default

Dir.glob('./{config,model,api}/*.rb').each { |file| require file }

module Interlat
  class Racing < Grape::API

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept'
      header['Access-Control-Request-Method'] = '*'
    end

    mount ConfigAPI
    mount RankingAPI
    add_swagger_documentation

  end
end
