class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item, optional: true

  validates_acceptance_of :accept, allow_nil: false, message: "※「受け取りを希望する」にチェックがありません。", on: :create
end
