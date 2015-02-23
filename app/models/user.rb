class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 8 }
end

# class User < ActiveRecord::Base
#   attr_accessor :password, :password_confirmation - this caused password/emails to fail testing validation
#   before_save { self.email = email.downcase }
#   validates :name, presence: true, length: { maximum: 50 }
#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#   validates :email, presence: true, length: { maximum: 255 },
#         format: { with: VALID_EMAIL_REGEX },
#         uniqueness: { case_sensitive: false}
#   has_secure_password
#   validates :password, length: { minimum: 8 }
# end

