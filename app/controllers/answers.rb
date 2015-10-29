# create new answer
post '/answers' do 
	@page_title = "Contribute An Answer | Quora Clone"
	if logged_in?
		@input = add_user_id(params[:answer])
		@answer = Answer.new(@input)
		@answer.save
			redirect to("/questions/#{@input["question_id"]}")
	else
			redirect to "/users/new"
	end
end

# show all answers submitted by user
get '/users/:id/answers' do
	@user = User.find_by(id: params[:id])
	@answers_list = Answer.where(user_id: @user.id).order(updated_at: :desc)
	erb :"answers/myanswers", :layout => false
end

