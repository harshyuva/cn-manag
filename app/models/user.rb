class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_one :card ,dependent: :destroy
 has_many :items ,dependent: :destroy
 has_one :cart,dependent: :destroy

 after_create :card_create
  def card_create
    #debugger
    self.build_cart.save
  end
end
