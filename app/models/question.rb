class Question < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :responses

	def self.search(search)
		where("title LIKE ? OR user_id LIKE ?", "%#{search}%", "%#{search}%")
	end

end
