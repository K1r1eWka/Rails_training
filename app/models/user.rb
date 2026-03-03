class User < ApplicationRecord
  # self. тут используем для того что бы сказать раился что мы ичпользует медот класса а не локальную переменную, то есть мы используем текущего пользователя
  before_save { self.email = email.downcase }
  has_many :articles
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
