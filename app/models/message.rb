class Message < ApplicationRecord
  
  attr_encrypted :body, :key => Rails.application.secrets.secret_key_base[0...32]

  belongs_to :user
  belongs_to :message_board

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

end
