class Course < ApplicationRecord
  belongs_to :burse
  belongs_to :cryptocurrency
  default_scope { order(created_at: :desc) }

  def valueshow
  	if (self.value != nil)
				'%.6f' % (self.value)
			else
				""
			end
  end

  def diffshow
  	if (self.diff != nil)
				'%.2f' % (self.diff)
			else
				""
			end
  end
end
