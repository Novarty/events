class Member < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :name,
            :phone,
            presence: true
end
