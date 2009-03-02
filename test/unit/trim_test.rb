require File.dirname(__FILE__) + '/../test_helper'
require 'net/http'
require 'uri'


class TrimTest < Test::Unit::TestCase

  context "A simple trim request to a valid URL" do
  	setup do
  		@long_url = 'http://www.google.com/'
  	end
  	
		should "provide a working shortened URL" do 
			trimmed_url = Trim.trim @long_url
			response = Net::HTTP.get_response(URI.parse(trimmed_url))
			assert response.kind_of? Net::HTTPRedirection
			assert_equal @long_url, response['location']
		end
  end

  context "A simple trim request to an invalid URL" do
  	setup do
  		@long_url = 'www'
  	end
  	
		should "return nil" do 
			trimmed_url = Trim.trim @long_url
			assert_nil trimmed_url
		end
  end

end