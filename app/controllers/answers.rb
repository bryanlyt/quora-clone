
# create new answer
post '/questions/:q_id/answers' do 
	@page_title = "Contribute An Answer | Quora Clone"
	if logged_in?
		@input = add_user_id(params[:answer])
		@answer = Answer.new(@input)
		if @answer.save
			redirect to("questions/#{@input["q_id"]}")
		else 
			# placeholder for jquery error response
			@error="You can only post 1 answer for a question. Please edit your previous answer instead"
			redirect to("/")
		end
	else
		# halt 401
	end
end

# show all answers submitted by user
get '/users/:id/answers' do
	@user = User.find_by(id: params[:id])
	@answers_list = Answer.where(user_id: @user.id).order(updated_at: :desc)
	erb :"users/:id/answers", :layout => false
end

