require 'httparty'
require 'multi_json'
require 'hashie'
require 'money'
require 'time'
require 'securerandom'

module Moolah
  class Client
    include HTTParty
    base_uri 'https://moolah.io'

    def balance options={}
      h = get '/account/balance', options
      h['amount'].to_money(h['currency'])
    end

    def receive_address options={}
      get '/account/receive_address', options
    end
    
    def generate_receive_address (options={})
      post '/api/pay', options
    end

    # Get URL
    def generate_url_payment (options={})
    	r = self.class.get('/api/pay', options)
    	return r
    end
  end
end
