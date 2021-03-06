# display all questions on homepage
get '/' do
	@page_title = "Welcome to Quora Clone"
	@list_title = "Most Recent Questions"
	@lists = Question.all.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 5)
	erb :"questions/all"
end

# create a new question
get '/questions/new' do
	@page_title = "Submit New Question | Quora Clone"
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
		if @question.save
			redirect to "/questions/#{@question.id}"
		else
			redirect to "/questions/new"
		end
end

# show single question page
get '/questions/:id' do
	@question = Question.find_by(id: params[:id])
	@page_title = "#{@question.description} | Quora Clone"
	@answers_list = Answer.where(question_id: params[:id]).order(updated_at: :desc)
	erb :"questions/view"
end

# show all questions submitted by user
get '/users/:id/questions' do
	@user = User.find_by(id: params[:id])
	@questions_list = Question.where(user_id: @user.id).order(updated_at: :desc)
	return erb :"questions/myquestions", :layout => false
end

# delete questions records from database
get '/questions/:id/delete' do 
	@question = Question.find_by(id: params[:id])
	@page_title = "Confirm deletion of Question ##{params[:id]}?"
	erb :"questions/delete"
end

delete '/questions/:id' do
	q = Question.find_by(id: params[:id])
	q.destroy!
	redirect to '/'
end

