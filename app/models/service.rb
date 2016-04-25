class Service < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  belongs_to :account
  has_many :order_items
  scope :status, -> (status) { where status: status }
  scope :currently_offered_as_part_of_service_agreement, -> (initial_date) { 
    after(initial_date, 
    field: :part_of_service_agreement_end_date).before(initial_date, 
    field: :part_of_service_agreement_start_date) 
  }
end
