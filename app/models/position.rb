class Position < ApplicationRecord
  belongs_to :company

  enum careers: [:developer, :business_intelligence, :information_technology, :design, :product, :technology, :other]
  enum contracts: [:clt, :pj, :match]

  validates :name, :career, :contract, :city, :state, :summary, presence: true
  has_rich_text :description
end
