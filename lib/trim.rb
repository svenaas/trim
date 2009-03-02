$:.unshift File.dirname(__FILE__)

require 'trim/version.rb'
require 'open-uri'
require 'libxml'

module Trim

	# 
	# Alias for Trim::trim_simple
	#
	def Trim::trim(url)
		response = nil
	  open("http://api.tr.im/api/trim_simple?url=#{url}") {|http| response = http.read }
	  response.strip!.size > 0 ? response : nil
  end

  #  
	# Returns a trimmed URL based on +url+, or nil if any error occurs.
	#
	#   trimmed_url = Trim.trim_simple('http://sample.com/some/long/url')
	#
	# Utilizes the tr.im API method trim_simple
	#	
	def Trim::trim_simple(url)
		response = nil
	  open("http://api.tr.im/api/trim_simple?url=#{url}") {|http| response = http.read }
	  response.strip!.size > 0 ? response : nil
  end

  #  
	# Returns a trimmed URL based on +url+, or nil if any error occurs.
	#
	#   trimmed_url = Trim.trim_url('http://sample.com/some/long/url')
	#	
	# Utilizes the tr.im API method trim_url.xml
	#
	def Trim::trim_url(url)
		xml_response = nil
	  open("http://api.tr.im/api/trim_url.xml?url=#{url}") {|http| xml_response = http.read }
		get_url_from_xml_response(xml_response)
  end

private  
	def Trim::get_url_from_xml_response(xml_response)
    parser = LibXML::XML::Parser.string xml_response
    urls = parser.parse.find('url')
    urls.size > 0 ? urls.first.content : nil
	end  
end