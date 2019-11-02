class TechnicsUnit < ApplicationRecord
  has_many :technics_repair_documents, dependent: :destroy
  has_many :transfer_documents, dependent: :destroy
end
