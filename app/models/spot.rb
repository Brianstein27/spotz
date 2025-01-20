class Spot < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :experiences, through: :links
  has_many :bookmarks
  has_many :visits
  has_many_attached :photos
  belongs_to :category

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :subtitle, presence: true
  validates :description, presence: true
end
