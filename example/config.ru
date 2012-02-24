require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-getglue'
require 'pp'

ENV['CONSUMER_KEY'] = ''
ENV['CONSUMER_SECRET'] = ''

class App < Sinatra::Base
  get '/' do
    redirect '/auth/getglue'
  end

  get '/auth/:provider/callback' do
    MultiJson.encode(request.env)
  end

  get '/auth/failure' do
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :getglue, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end

run App.new