class User < ApplicationRecord
  devise    :database_authenticatable,
            :registerable,
            :confirmable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable
  validates :name,
            presence: true
  has_many  :events, dependent: :destroy
end
