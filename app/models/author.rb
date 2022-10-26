class Author < ApplicationRecord
  def name
    "#{first_name} #{last_name}"
  end

  def ==(o)
    o.class == self.class &&
    o.first_name == self.first_name &&
    o.last_name == self.last_name &&
    o.homepage == self.homepage
  end
end
