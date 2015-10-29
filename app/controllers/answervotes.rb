post '/answervotes/vote' do
	if logged_in?
		@input = add_user_id(params[:answervote])
		@answervote = AnswerVote.create!(@input)
		redirect to("/questions/#{@input["question_id"]}")
	else
		redirect to "/users/new"
	end
end
