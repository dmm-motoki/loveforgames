class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  devise :database_authenticatable, authentication_keys: [:name]


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
