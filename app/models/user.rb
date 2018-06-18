class User < ApplicationRecord
  devise    :database_authenticatable,
            :registerable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable
  validates :name,
            presence: true
  has_many  :events, dependent: :destroy
  has_many :members
  has_many :events, through: :members, dependent: :destroy
end
