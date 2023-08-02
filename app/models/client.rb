class Client < ApplicationRecord
  validates :ip, presence: true, uniqueness: true
end
