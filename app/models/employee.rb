class Employee < ApplicationRecord
  enum sex: [:male, :female]
  has_many :technics_repair_documents
  belongs_to :subdivision, class_name: 'Subdivision', foreign_key: "subdivision_id"
end
