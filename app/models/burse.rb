require 'net/http'
require 'addressable/uri'

class Burse < ApplicationRecord
	def diff_procent(a, b)
		(a - b) / ((a + b) / 2.0) * 100.0
	end

	def run_exmo
		Cryptocurrency.all.each { |e|  
			url = "https://api.exmo.com/v1/order_book/?pair=#{e.currency}_BTC"
			uri = URI.parse(url)
		    https = Net::HTTP.new(uri.host, uri.port)
		    https.use_ssl = true

			answer = https.get(uri.request_uri).body
			
			hash = JSON.parse(answer)

			puts hash["#{e.currency}_BTC"]["ask_top"]

			course = Course.new
			course.burse = self
			course.cryptocurrency = e
			course.value = hash["#{e.currency}_BTC"]["ask_top"].to_f
			first = Course.first
			if (first != nil)
				if (first.diff == nil)
					first.diff = course.value
				end
				course.diff = diff_procent(first.diff, course.value)
			end
			course.save


		}
	end

	def run_cryptopia
		Cryptocurrency.all.each { |e|  
			url = "https://www.cryptopia.co.nz/api/GetMarket/#{e.currency}_BTC"
			uri = URI.parse(url)
		    https = Net::HTTP.new(uri.host, uri.port)
		    https.use_ssl = true

			answer = https.get(uri.request_uri).body
			
			hash = JSON.parse(answer)

			puts hash["Data"]["BidPrice"]

			course = Course.new
			course.burse = self
			course.cryptocurrency = e
			course.value = hash["Data"]["BidPrice"].to_f
			first = Course.first
			if (first != nil)
				if (first.diff == nil)
					first.diff = course.value
				end
				course.diff = diff_procent(first.diff, course.value)
			end
			course.save


		}
	end

	def run_binance
		Cryptocurrency.all.each { |e|  
			url = "https://api.binance.com/api/v3/ticker/bookTicker?symbol=#{e.currency}BTC"
			uri = URI.parse(url)
		    https = Net::HTTP.new(uri.host, uri.port)
		    https.use_ssl = true

			answer = https.get(uri.request_uri).body
			
			hash = JSON.parse(answer)

			puts hash["bidPrice"]

			course = Course.new
			course.burse = self
			course.cryptocurrency = e
			course.value = hash["bidPrice"].to_f
			first = Course.first
			if (first != nil)
				if (first.diff == nil)
					first.diff = course.value
				end
				course.diff = diff_procent(first.diff, course.value)
			end
			course.save


		}
	end

	def run_livecoin
		Cryptocurrency.all.each { |e|  
			url = "https://api.livecoin.net/exchange/ticker?currencyPair=#{e.currency}/BTC"
			uri = URI.parse(url)
		    https = Net::HTTP.new(uri.host, uri.port)
		    https.use_ssl = true

			answer = https.get(uri.request_uri).body
			
			hash = JSON.parse(answer)

			puts hash["best_bid"]

			course = Course.new
			course.burse = self
			course.cryptocurrency = e
			course.value = hash["best_bid"].to_f
			first = Course.first
			if (first != nil)
				if (first.diff == nil)
					first.diff = course.value
				end
				course.diff = diff_procent(first.diff, course.value)
			end
			course.save

		}
	end

	def run_poloniex
		Cryptocurrency.all.each { |e|  
			url = "https://poloniex.com/public?command=returnTicker"
			uri = URI.parse(url)
		    https = Net::HTTP.new(uri.host, uri.port)
		    https.use_ssl = true

			answer = https.get(uri.request_uri).body
			
			hash = JSON.parse(answer)

			puts hash["BTC_#{e.currency}"]["lowestAsk"]

			course = Course.new
			course.burse = self
			course.cryptocurrency = e
			course.value = hash["BTC_#{e.currency}"]["lowestAsk"].to_f
			first = Course.first
			if (first != nil)
				if (first.diff == nil)
					first.diff = course.value
				end
				course.diff = diff_procent(first.diff, course.value)
			end
			course.save

		}
	end

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
					course.diff = diff_procent(first.diff, course.value)
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

		}
	end
end
