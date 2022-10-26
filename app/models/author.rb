class Author < ApplicationRecord
  validates :last_name, presence: true, length: { minimum: 1 }
  validate :homepage_starts_with_http

  def name
    "#{first_name} #{last_name}"
  end

  def ==(o)
    o.class == self.class &&
    o.first_name == self.first_name &&
    o.last_name == self.last_name &&
    o.homepage == self.homepage
  end

private
  def homepage_starts_with_http
    errors.add(:name, "s homepage doesn't start with http") unless homepage.start_with?("http")
  end
end
