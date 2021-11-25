class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image

  belongs_to :category
  belongs_to :condition

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options presence: true, numericality: { other_than: 0, message: "が選択されていません" } do
    validates :category_id
    validates :condition_id
  end

end
