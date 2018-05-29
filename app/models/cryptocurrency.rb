require 'net/http'
require 'addressable/uri'

class Cryptocurrency < ApplicationRecord

	has_many :courses

	def diff(burse)
		first = self.courses.where(:burse => burse).first
		if (first != nil)
			first.diff
		else
			""
		end
	end
	def course(burse)
		first = self.courses.where(:burse => burse).first
		if (first != nil)
			first.value
		else
			""
		end
	end

end
