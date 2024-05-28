class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5, message: "has to be between 1 and 5" }
end
