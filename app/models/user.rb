class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, dependent: :destroy
  has_many :places, dependent: :destroy
 # ANDRES MADE ME DO IT validates :first_name, :last_name, :phone_number, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
