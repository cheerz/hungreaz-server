class User < ApplicationRecord

  include Extendable

  indexable :email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :nickname, presence: true, uniqueness: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_validation do
    self.nickname ||= email.split('@').first
    self.nickname = nickname.downcase
  end

  def set_session_token!
    update! session_token: generate_session_token
  end

  def reset_session_token!
    update! session_token: nil
  end

  def generate_session_token
    SecureRandom.hex(30)
  end

end
