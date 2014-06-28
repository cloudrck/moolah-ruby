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
    
    def initialize
		  @headers = {headers: {'User-Agent' => 'application/ruby.sinatra+json'} }}
	  end
    # Get URL
    def generate_url_payment (options={})
    	r = self.class.get('/api/pay', :query => options, :headers => @headers)
    	return r
    end
  end
end
