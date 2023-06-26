class Quote < ApplicationRecord
  belongs_to :company
  validates :name, presence: true

  has_many :line_item_dates, dependent: :destroy

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
