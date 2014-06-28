require 'httparty'


module Moolah
  class Client
    include HTTParty
    base_uri 'https://moolah.io'
    headers 'User-Agent' => 'application/ruby+json'
    
    # Get URL
    def generate_url_payment (options={})
    	r = self.class.get('/api/pay', options)
    	return r
    end
  end
end
