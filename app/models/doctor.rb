class Doctor < ApplicationRecord
  validates :first_name, presence: true
end
