class User < ApplicationRecord
  has_many :recipe
  has_many :foods

  validates :name, presence: true
end
