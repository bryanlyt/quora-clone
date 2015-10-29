class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :question
	validates :user_id, :uniqueness => {:scope => :question_id}, presence: true 
	# one user can only answer once for a question
end
