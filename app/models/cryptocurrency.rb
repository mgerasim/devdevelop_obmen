require 'net/http'
require 'addressable/uri'

class Cryptocurrency < ApplicationRecord

	has_many :courses

	def diff(burse)
		first = self.courses.where(:burse => burse).first
		if (first != nil)
			if (first.diff != nil)
				first.diff.round(6)
			else
				""
			end
		else
			""
		end
	end
	def course(burse)
		first = self.courses.where(:burse => burse).first
		if (first != nil)
			if (first.value != nil)
				first.value.round(6)
			else
				""
			end
		else
			""
		end
	end

end
