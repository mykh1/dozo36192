class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:employee_number]

  with_options presence: true do
    validates :employee_number
    validates :nickname
  end
      
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
    validates :last_name
    validates :first_name
  end
      
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
    validates :last_name_reading
    validates :first_name_reading
  end
      


  #emailを不要とする
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
end
