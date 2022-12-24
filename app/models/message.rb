class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :direct_message, presence: true
end
