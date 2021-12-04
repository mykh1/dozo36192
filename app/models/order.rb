class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item, optional: true

  # validates_acceptance_of :accept, allow_nil: false, on: :create
end
