$:.unshift File.dirname(__FILE__)

require 'trim/version.rb'

require 'open-uri'

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
	def Trim::trim_simple(url)
		response = nil
	  open("http://api.tr.im/api/trim_simple?url=#{url}") {|http| response = http.read }
	  response.strip!.size > 0 ? response : nil
  end
		  
end