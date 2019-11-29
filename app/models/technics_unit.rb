class TechnicsUnit < ApplicationRecord
  has_many :technics_repair_documents, dependent: :destroy
  has_many :transfer_documents, dependent: :destroy
  belongs_to :subdivision, class_name: 'Subdivision', foreign_key: "subdivision_id"
end
