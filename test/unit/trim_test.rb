require File.dirname(__FILE__) + '/../test_helper'
require 'mocha'

class TrimTest < Test::Unit::TestCase

	VALID_SHORTENED_URL = "http://tr.im/OK"

  context "With a valid account" do    
    setup do
      @username = 'user'
      @password = 'pass'
      @long_url = 'http://www.google.com/'
    end

    context "account verification" do
      should "succeed" do 
        Trim.expects(:valid_account?).with(@username, @password).returns(true)
        assert Trim.valid_account?(@username, @password)
      end
    end        
    
    context "a trim_simple request" do 
			should "provide a working shortened URL" do 
			  Trim.expects(:trim_simple).with(@long_url, @username, @password).returns(VALID_SHORTENED_URL)
				trimmed_url = Trim.trim_simple @long_url, @username, @password
				assert_equal VALID_SHORTENED_URL, trimmed_url 
			end
		end
		
    context "a trim_url request" do 
			should "provide a working shortened URL" do 
			  Trim.expects(:trim_url).with(@long_url, @username, @password).returns(VALID_SHORTENED_URL)
				trimmed_url = Trim.trim_url @long_url, @username, @password
				assert_equal VALID_SHORTENED_URL, trimmed_url 
			end
		end		
  end      

  context "With an invalid account" do    
    setup do
      @username = 'baduser'
      @password = 'badpass'
    end

    context "account verification" do
      should "fail" do 
        Trim.expects(:valid_account?).with(@username, @password).returns(false)
        assert ! Trim.valid_account?(@username, @password)
      end
    end        
  end
	
	context "Anonymously" do	  	  
  	context "using a valid URL" do  		
  		setup do
  			@long_url = 'http://www.google.com/'
  		end
  		
  		context "a trim_simple request" do  	
  			should "provide a working shortened URL" do 
  			  Trim.expects(:trim_simple).with(@long_url).returns(VALID_SHORTENED_URL)
  				trimmed_url = Trim.trim_simple @long_url
  				assert_equal VALID_SHORTENED_URL, trimmed_url 
  			end
  		end
  		
      context "a trim_url request" do    
        should "provide a working shortened URL" do 
  			  Trim.expects(:trim_url).with(@long_url).returns(VALID_SHORTENED_URL)
          trimmed_url = Trim.trim_url @long_url
          assert_equal VALID_SHORTENED_URL, trimmed_url 
        end
      end
      
    end
     
    context "using an invalid URL" do       
      setup do
        @long_url = 'www'
      end
    
      context "a trim_simple request" do      
        should "return nil" do 
          Trim.expects(:trim_simple).with(@long_url).returns(nil)
          trimmed_url = Trim.trim_simple @long_url
          assert_nil trimmed_url
        end
      end
    
      context "a trim_url request" do      
        should "return nil" do 
          Trim.expects(:trim_url).with(@long_url).returns(nil)
          trimmed_url = Trim.trim_url @long_url
          assert_nil trimmed_url
        end
      end
    
    end
    
    context "using an empty URL" do      
      setup do
        @long_url = ''
      end
    
      context "a trim_simple request" do      
        should "return nil" do 
          Trim.expects(:trim_simple).with('').returns(nil)
          trimmed_url = Trim.trim_simple @long_url
          assert_nil trimmed_url
        end
      end
    
      context "a trim_url request" do      
        should "return nil" do 
          Trim.expects(:trim_url).with('').returns(nil)
          trimmed_url = Trim.trim_url @long_url
          assert_nil trimmed_url
        end
      end
    
    end
    
    context "using a nil URL" do      
      setup do
        @long_url = nil
      end
    
      context "a trim_simple request" do      
        should "return nil" do 
          Trim.expects(:trim_simple).with(nil).returns(nil)
          trimmed_url = Trim.trim_simple @long_url
          assert_nil trimmed_url
        end
      end
    
      context "a trim_url request" do      
        should "return nil" do 
          Trim.expects(:trim_url).with(nil).returns(nil)
          trimmed_url = Trim.trim_url @long_url
          assert_nil trimmed_url
        end
      end    
    end
  end
end