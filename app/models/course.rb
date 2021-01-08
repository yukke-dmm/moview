class Course < ApplicationRecord
  belongs_to :user
  has_many :sections
  validates :title, presence: true, length: { maximum: 50 }
  validates :introduce, presence: true, length: { maximum: 200 }

  attachment :image

end
