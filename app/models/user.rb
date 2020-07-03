class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # belongs_to :manager, class_name: 'User'
  # has_many :reports, class_name: 'User'

  has_many :accomplishments
  has_many :meetings
end
