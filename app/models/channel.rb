class Channel < ActiveRecord::Base
  has_many :messages
  has_many :user_channels
  has_many :users, through: :user_channel
  validates :api_id, presence: true
  validates :api_id, uniqueness: true
  validates :name, presence: true

  def get_messages
    self.messages.all
  end

  def get_users
    self.users.all
  end

  def check_in(uid)
    #TODO: Check if user is in it first
    self.user_channels.create(user_id: uid, timeout: DateTime.in(120))
  end

  def cleanup_users
    #TODO: REMOVE INACTIVE USERS
  end

end
