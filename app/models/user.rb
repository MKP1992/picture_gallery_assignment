class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    validates :username, presence: true

	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable

	has_many :pictures, :dependent => :destroy
	has_many :categories, through: :pictures
end
