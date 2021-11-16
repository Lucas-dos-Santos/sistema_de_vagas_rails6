class Position < ApplicationRecord
  belongs_to :company
  before_save :set_slug
  has_many :applicants

  enum career: [:developer, :business_intelligence, :information_technology, :design, :product, :technology, :other]
  enum contract: [:clt, :pj, :match]

  validates :name, :career, :contract, :city, :state, :summary, presence: true
  has_rich_text :description

  private

  def set_slug
    self.slug = "#{self.company.name.parameterize}-#{self.name.parameterize}"
  end
end
