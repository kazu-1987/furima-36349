class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,:email, :birth_day, presence: true
  validates :first_name, presence: true,  presence: {message: 'first name cant be black'}
  validates :last_name, presence: true,  presence: {message: 'last name cant be black'}
  validates :first_name_kana, presence: true, presence: {message: 'first name kana cant be black'}
  validates :last_name_kana, presence: true, presence: {message: 'last name kana cant be black'}
  validates :email, uniqueness: true
  validates :first_name,
               :last_name,
               :first_name_kana,
               :last_name_kana,
               format: {with: /[^ -~｡-ﾟ]+/,message: 'Full-width characters'}

       
end
