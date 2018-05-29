require 'net/http'
require 'addressable/uri'

class Cryptocurrency < ApplicationRecord

	after_save :course_update

	has_many :courses

	def diff(burse)
		self.courses.where(:burse => burse).first.diff
	end
	def course(burse)
		self.courses.where(:burse => burse).first.value
	end

	def course_update
	    url = "https://api.exmo.com/v1/order_book/?pair=BTC_#{self.currency}"
	    puts url
	        
	    uri = URI.parse(url)
	    https = Net::HTTP.new(uri.host, uri.port)
	    https.use_ssl = true

		answer = https.get(uri.request_uri).body
		
		hash = JSON.parse(answer)
		course = 1.0
		if (hash["BTC_#{self.currency}"] != nil) 
	        	course = hash["BTC_#{self.currency}"]["bid_top"]
	    end
	                 
		self.update_column(:course, course)
	end

end
