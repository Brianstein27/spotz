class Experience < ApplicationRecord
  has_many :reviews, as :reviewable
  has_many :spots, through: :links
  belongs_to :user

  validates :name, presence: true, length: { maximum: 85 }
  validates :description, length: { maximum: 256 }
end
