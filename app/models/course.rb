class Course < ApplicationRecord
  belongs_to :user
  validates :introduce, presence: true, length: { maximum: 200 }
end
