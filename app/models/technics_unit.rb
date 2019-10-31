class TechnicsUnit < ApplicationRecord
  has_many :technics_repair_documents
  has_many :transfer_documents
end
