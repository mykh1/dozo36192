class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates_acceptance_of :accept, allow_nil: false, on: :create
end
