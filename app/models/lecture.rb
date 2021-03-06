class Lecture < ApplicationRecord
  belongs_to :section
  has_many :is_completed_lectures,dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :introduce, presence: true, length: { maximum: 200 }

  include RankedModel
  ranks :row_order, with_same: :section_id

  def checked_by?(user)
    is_completed_lectures.where(user_id: user.id).exists?
  end
end
