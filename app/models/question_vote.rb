class QuestionVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :question
	belongs_to :user
	validates :user_id, :uniqueness => {:scope => :question_id}, presence: true
	# Only one user can vote once

end
