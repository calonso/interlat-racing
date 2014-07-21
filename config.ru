
require 'rack/cors'
require_relative 'racing'

$stdout.sync = true

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [ :get, :post ]
  end
end

run Interlat::Racing
