require File.dirname(__FILE__) + '/../test_helper'
require 'net/http'
require 'uri'


class TrimTest < Test::Unit::TestCase

	context "A valid URL" do
		
		setup do
			@long_url = 'http://www.google.com/'
		end
		
		context "A trim_simple request" do  	
			should "provide a working shortened URL" do 
				trimmed_url = Trim.trim_simple @long_url
				response = Net::HTTP.get_response(URI.parse(trimmed_url))
				assert response.kind_of?(Net::HTTPRedirection)
				assert_equal @long_url, response['location']
			end
		end
		
		context "A trim_url request" do  	
			should "provide a working shortened URL" do 
				trimmed_url = Trim.trim_url @long_url
				response = Net::HTTP.get_response(URI.parse(trimmed_url))
				assert response.kind_of?(Net::HTTPRedirection)
				assert_equal @long_url, response['location']
			end
		end
		
  end

	context "An invalid URL" do
		
		setup do
  		@long_url = 'www'
  	end
	
	  context "A trim_simple request" do	  	
			should "return nil" do 
				trimmed_url = Trim.trim @long_url
				assert_nil trimmed_url
			end
		end

	  context "A trim_url request" do	  	
			should "return nil" do 
				trimmed_url = Trim.trim @long_url
				assert_nil trimmed_url
			end
		end

  end

	context "An empty URL" do
		
		setup do
  		@long_url = ''
  	end
	
	  context "A trim_simple request" do	  	
			should "return nil" do 
				trimmed_url = Trim.trim @long_url
				assert_nil trimmed_url
			end
		end

	  context "A trim_url request" do	  	
			should "return nil" do 
				trimmed_url = Trim.trim @long_url
				assert_nil trimmed_url
			end
		end

  end

	context "A nil URL" do
		
		setup do
  		@long_url = nil
  	end
	
	  context "A trim_simple request" do	  	
			should "return nil" do 
				trimmed_url = Trim.trim @long_url
				assert_nil trimmed_url
			end
		end

	  context "A trim_url request" do	  	
			should "return nil" do 
				trimmed_url = Trim.trim @long_url
				assert_nil trimmed_url
			end
		end

  end

end