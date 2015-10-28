# create a new question
get '/questions/new' do
	@page_title = "Ask A Question | Quora Clone"
	erb :"questions/new"
end

# submit a new question
post '/questions' do
	if logged_in?
		@input = add_user_id(params[:question])
	else
		@input = params[:question]
	end
	
	@question = Question.new(@input)
		if questions.save
			redirect to('/')
		else
			@error = @question.errors.full_messages[0]
			erb :"questions/new"
		end
end

# show single question page
get '/questions/:id' do
	@page_title = "#{@question.title} | Quora Clone"
	@question = Question.find_by(id: params[:id])
	@answers_list = Answer.where(question_id: params[:id]).order(updated_at: :desc)
	erb :"questions/view"
end

# display all questions on homepage
get '/questions' do
	@page_title = "Homepage | Quora Clone"
	@list_title = "Most Recent Questions"
	@list = Question.all.order(updated_at: :desc)
	erb :"questions/all"
end

# show all questions submitted by user
get '/users/:id/questions' do
	@user = User.find_by(id: params[:id])
	@questions_list = Question.where(user_id: @user.id).order(updated_at: :desc)
	return erb :"users/:id/questions", :layout => false
end

