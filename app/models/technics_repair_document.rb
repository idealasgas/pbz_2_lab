class TechnicsRepairDocument < ApplicationRecord
  belongs_to :technics_unit
  belongs_to :client, class_name: 'Employee', foreign_key: "client_id"
  belongs_to :receiver, class_name: 'Employee', foreign_key: "receiver_id"
  belongs_to :repair_man, class_name: 'Employee', foreign_key: "repair_man_id"
  has_one :invoice, dependent: :destroy
end
