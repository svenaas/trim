$:.unshift File.dirname(__FILE__)

require 'trim/version.rb'
require 'open-uri'
require 'libxml'

module Trim

	# 
	# Alias for #Trim::trim_simple
	#
	def Trim::trim(url, username = nil, password = nil)		
	  trim_simple(url, username, password)	  
  end

  #  
	# Returns a trimmed URL based on +url+, or nil if any error occurs.
	#
	#   trimmed_url = Trim.trim_simple('http://sample.com/some/long/url')
	#
	# If a +username+ and +password+ are provided they will be passed to tr.im
	# for authentication. NOTE: as of this writing (3 Mar 2009) tr.im does 
	# not support SSL so this username and password will be sent over
	# unencrypted HTTP.
	# 
	# If the username and password provided are not valid, tr.tim will still
	# generate a shortened URL, but will do so as if no username and password
	# were provided. The account credentials can be verified with #Trim::valid_account?
	#
	# This method utilizes the tr.im API method trim_simple
	#	
	def Trim::trim_simple(url, username = nil, password = nil)
		response = nil
		request_url = "http://api.tr.im/api/trim_simple?url=#{url}"
		request_url += "&username=#{username}&password=#{password}" if (username and password)
	  open(request_url) {|http| response = http.read }
	  response.strip!.size > 0 ? response : nil
  end

  #  
	# Returns a trimmed URL based on +url+, or nil if any error occurs.
	#
	#   trimmed_url = Trim.trim_url('http://sample.com/some/long/url')
	#
	# If a +username+ and +password+ are provided they will be passed to tr.im
	# for authentication. NOTE: as of this writing (3 Mar 2009) tr.im does 
	# not support SSL so this username and password will be sent over
	# unencrypted HTTP.
	# 
	# If the username and password provided are not valid, tr.tim will still
	# generate a shortened URL, but will do so as if no username and password
	# were provided. The account credentials can be verified with #Trim::valid_account?
	#	
	# Utilizes the tr.im API method trim_url.xml
	#
	def Trim::trim_url(url, username = nil, password = nil)
		xml_response = nil
		request_url = "http://api.tr.im/api/trim_url.xml?url=#{url}"
		request_url += "&username=#{username}&password=#{password}" if (username and password)
	  open(request_url) {|http| xml_response = http.read }
		get_url_from_xml_response(xml_response)
  end
  
  #  
	# Verifies that the provided +username+ and +password+ successfully 
	# validate as an account known to tr.im
	#
	#   is_valid_account = Trim.valid_account?('good_username', 'good_password')
	#
	# NOTE: as of this writing (3 Mar 2009) tr.im does not support SSL so this 
	# username and password will be sent over unencrypted HTTP.
	# 
	# Utilizes the tr.im API method verify.xml
	#  
  def Trim::valid_account?(username, password)
		xml_response = nil
		request_url = "http://api.tr.im/api/verify.xml?username=#{username}&password=#{password}"
	  open(request_url) {|http| xml_response = http.read }
    status_code = get_status_code_from_xml_response(xml_response)
    "200" == status_code
  end

private  
	def Trim::get_url_from_xml_response(xml_response)
    parser = LibXML::XML::Parser.string xml_response
    urls = parser.parse.find('url')
    urls.size > 0 ? urls.first.content : nil
	end  
	
	def Trim::get_status_code_from_xml_response(xml_response)	
    parser = LibXML::XML::Parser.string xml_response
    status = parser.parse.root.attributes['code']      
	end 
end