class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
            validates :nickname
            EMAIL_REGEX = %r{\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z}.freeze
            validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
            PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
            validates :password, confirmation: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
            validates :password_confirmation
            NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
            validates :last_name, format: { with: NAME_REGEX }
            validates :first_name, format: { with: NAME_REGEX }
            KANA_REGEX = /\A[ァ-ン]+\z/
            validates :last_name_kana, format: { with: KANA_REGEX }
            validates :first_name_kana, format: { with: KANA_REGEX }
            validates :birthday
         end
end
