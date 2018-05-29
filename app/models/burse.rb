require 'net/http'
require 'addressable/uri'

class Burse < ApplicationRecord
	def run_bittrex
		Cryptocurrency.all.each { |e|  
			puts e.currency


			url = "https://bittrex.com/api/v1.1/public/getticker/?market=BTC-#{e.currency}"
		    puts url
		        
		    uri = URI.parse(url)
		    https = Net::HTTP.new(uri.host, uri.port)
		    https.use_ssl = true

			answer = https.get(uri.request_uri).body
			
			hash = JSON.parse(answer)

			puts hash

			if (hash["success"] == true) 

				course = Course.new
				course.burse = self
				course.cryptocurrency = e
				puts hash["result"]['Ask']
				course.value = hash["result"]['Ask'].to_f
				first = Course.first
				if (first != nil)
					if (first.diff == nil)
						first.diff = course.value
					end
					course.diff = course.value - first.diff
				end
				course.save
			else

				course = Course.new
				course.burse = self
				course.cryptocurrency = e
				course.error = hash["message"]
				puts hash["message"]

				course.save
			end

			#course = 1.0
			#if (hash["BTC_#{self.currency}"] != nil) 
		    #    	course = hash["BTC_#{self.currency}"]["bid_top"]
		    #end
		   #              
		#	self.update_column(:course, course)

		}
	end
end
