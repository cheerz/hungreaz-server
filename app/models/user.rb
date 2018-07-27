class User < ApplicationRecord

  include Extendable

  indexable :email

  has_many :places
  has_many :user_events
  has_many :events, through: :user_events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :nickname, presence: true, uniqueness: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :sexe, inclusion: { in: ['male', 'female', nil] }

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
    "#{ Time.now.to_i }#{ SecureRandom.hex(30) }"
  end

end
