class Company < ApplicationRecord
  belongs_to :user
  has_many :positions
  validates :name, :url, :logo, presence: true
  has_one_attached :logo
end
