class TechnicsRepairDocument < ApplicationRecord
  belongs_to :technics_unit
  belongs_to :client, class_name: 'Employee', foreign_key: "client_id"
  belongs_to :receiver, class_name: 'Employee', foreign_key: "receiver_id"
  belongs_to :repairman, class_name: 'Employee', foreign_key: "repairman_id"
  has_many :invoices
end
