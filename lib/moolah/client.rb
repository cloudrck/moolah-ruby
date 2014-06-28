require 'httparty'


module Moolah
  class Client
    include HTTParty
    base_uri 'https://moolah.io'
    
    def initialize
	@headers = {headers: {'User-Agent' => 'application/ruby.sinatra+json'} }}
    end
    # Get URL
    def generate_url_payment (options={})
    	r = self.class.get('/api/pay', options, @headers)
    	return r
    end
  end
end
