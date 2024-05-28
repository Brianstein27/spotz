class Event < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :image_url, presence: true
end
