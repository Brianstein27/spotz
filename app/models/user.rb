class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :username, presence: true, length: { in: 3..25 }, uniqueness: true

  has_many :bookmarks, dependent: :destroy
  has_many :visits, dependent: :destroy
end
