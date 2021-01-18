class Section < ApplicationRecord
  belongs_to :course
  has_many :lectures,dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :introduce, presence: true, length: { maximum: 200 }
end
