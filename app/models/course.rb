class Course < ApplicationRecord
  belongs_to :burse
  belongs_to :cryptocurrency
  default_scope { order(created_at: :desc) }
end
