class Category < ApplicationRecord
  searchkick

  has_many :spots, dependent: :destroy

  validates :name, presence: true

end
