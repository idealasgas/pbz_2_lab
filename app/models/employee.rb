class Employee < ApplicationRecord
  enum sex: [:male, :female]
end
