class Lecture < ApplicationRecord
  belongs_to :section
  validates :title, presence: true, length: { maximum: 50 }
  validates :introduce, presence: true, length: { maximum: 200 }
end
