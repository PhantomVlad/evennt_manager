class Event < ApplicationRecord
  validate :adress, presence: true
  validate :title, presence: true, length: {maximum:255}
  validate :datetime, presence: true
end
