class User < ApplicationRecord
	# has_many :courses
  has_many :is_completed_lectures

	before_save { email.downcase! }

    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false}
    has_secure_password
    validates :password,presence: true,length: {minimum:6},allow_nil: true
    # allow_nil:trueで編集の時のパスワードは入れなくても良くなる。登録時のチェックはhas_secure_passwordが存在性を検証してくれているの空欄にできなくなっている。
    validates :employee_number,uniqueness: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end