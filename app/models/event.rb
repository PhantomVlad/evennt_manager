class Event < ApplicationRecord
  validates :address, presence: true
  validates :title, presence: true, length: {maximum:255}
  validates :datetime, presence: true
end
