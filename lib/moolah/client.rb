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

    def initialize(guid)
      @@guid = guid.to_s
      #@guid = api_key.to_s
      #@api_secret = api_secret

      # defaults
      #options[:base_uri] ||= 'https://moolah.io'
      #@base_uri = options[:base_uri]
      #options[:format]   ||= :json
      #options.each do |k,v|
        #self.class.send k, v
      #end
    end
    def self.api_key=(api_key)
        @@api_key = api_key
    end

    def self.api_key
        @@api_key
    end

    # Account

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
      #opts = {:guid => @@guid}
      #options[:query][:guid] = @@guid
    	#options                      ||= {}
    	#opt[:query][:guid]                 ||= @guid
    	#options[:query][:amount].to_money unless price.is_a?(Money)
    	#options[:query][:currency].currency.iso_code
    	#options[:amount]         ||= amount.to_f.to_s
    	#options[:product]   ||= price.currency.iso_code
    	#options[:return]          ||= callback_url
    	#options[:button][:custom]               ||= custom
    	r = self.class.get('/api/pay', options)
    	#r = options
    	return r
    end
  end
end
