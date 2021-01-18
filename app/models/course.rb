class Course < ApplicationRecord
  # belongs_to :user
  belongs_to :admin
  has_many :sections,dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :introduce, presence: true, length: { maximum: 200 }

  attachment :image

end
