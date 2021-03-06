
require 'bundler/setup'
Bundler.require :default

Dir.glob('./{config,model,api}/*.rb').each { |file| require file }

module Interlat
  class Racing < Grape::API

    mount ConfigAPI
    mount RankingAPI
    add_swagger_documentation

  end
end
