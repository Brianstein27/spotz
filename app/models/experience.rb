class Experience < ApplicationRecord
  has_many :reviews, as :reviewable
  belongs_to :user
end
