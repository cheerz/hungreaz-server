class UserEvent < ApplicationRecord

  belongs_to :user
  belongs_to :event

  validates :user, uniqueness: {scope: :event}

  def user_email= email_value
    self.user = User[email_value]
  end

end
