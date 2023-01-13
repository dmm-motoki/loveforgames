class Request < ApplicationRecord
  validates :title, presence: true
end
