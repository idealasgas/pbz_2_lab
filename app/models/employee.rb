class Employee < ApplicationRecord
  enum sex: [:male, :female]
  has_many :technics_repair_documents
end
