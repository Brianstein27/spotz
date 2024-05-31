class Experience < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :links
  has_many :spots, through: :links
  belongs_to :user

  validates :name, presence: true, length: { maximum: 85 }
  validates :description, length: { maximum: 256 }

  # include PgSearch::Model

  # pg_search_scope :search_by_name_and_description,
  # against: [:name, :description],
  # using: {
  #   tsearch: { prefix: true }
  # }

  # multisearchable against: [:name, :description]
end
