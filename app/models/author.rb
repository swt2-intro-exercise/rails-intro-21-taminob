class Author < ApplicationRecord
  validates :last_name, presence: true
  def name
    return first_name + ' ' + last_name
  end
end
