# index redirects to questions page which shows a list of questions
get '/' do
	redirect to('/questions')
end

# register a new user
get '/users/new' do
	@page_title = "User Registration"
	erb :"users/new"
end

# show user profile page
get '/users/:id' do 
	@page_title = "User Profile"
 	erb :"users/profile"
end

# create new user
post '/users' do 
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect to('/')
	else
		@error = @user.errors.full_messages[0]
		erb :"users/new"
	end
end
