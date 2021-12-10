class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates_acceptance_of :accept, allow_nil: false, message: "を希望する にチェックがありません。", on: :create
end
