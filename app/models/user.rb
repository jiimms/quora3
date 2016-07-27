class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 3..120
         has_many :questions
         has_many :responses
         has_many :favorites
				 has_many :favorite_questions, through: :favorites, source: :favorited, source_type: 'Question'
				 has_one :userprofile
end
