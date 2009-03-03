require File.dirname(__FILE__) + '/../test_helper'
require 'mocha'

class TrimTest < Test::Unit::TestCase

	VALID_SHORTENED_URL = "http://tr.im/OK"
	
	context "A valid URL" do
		
		setup do
			@long_url = 'http://www.google.com/'
		end
		
		context "A trim_simple request" do  	
			should "provide a working shortened URL" do 
			  Trim.expects(:trim_simple).with(@long_url).returns(VALID_SHORTENED_URL)
				trimmed_url = Trim.trim_simple @long_url
				assert_equal VALID_SHORTENED_URL, trimmed_url 
			end
		end
		
    context "A trim_url request" do    
      should "provide a working shortened URL" do 
			  Trim.expects(:trim_url).with(@long_url).returns(VALID_SHORTENED_URL)
        trimmed_url = Trim.trim_url @long_url
        assert_equal VALID_SHORTENED_URL, trimmed_url 
      end
    end
    
  end
   
  context "An invalid URL" do
     
    setup do
      @long_url = 'www'
    end
  
    context "A trim_simple request" do      
      should "return nil" do 
        Trim.expects(:trim_simple).with(@long_url).returns(nil)
        trimmed_url = Trim.trim_simple @long_url
        assert_nil trimmed_url
      end
    end
  
    context "A trim_url request" do      
      should "return nil" do 
        Trim.expects(:trim_url).with(@long_url).returns(nil)
        trimmed_url = Trim.trim_url @long_url
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
        Trim.expects(:trim_simple).with('').returns(nil)
        trimmed_url = Trim.trim_simple @long_url
        assert_nil trimmed_url
      end
    end
  
    context "A trim_url request" do      
      should "return nil" do 
        Trim.expects(:trim_url).with('').returns(nil)
        trimmed_url = Trim.trim_url @long_url
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