class Paper < ApplicationRecord
    scope :written_in, ->(year) { where("year = ?", year) if year.present? }

    has_and_belongs_to_many :authors
    validates :title, :venue, :year, presence: true
    validates :year, numericality: true
end
