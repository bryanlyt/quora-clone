# register a new user 
get '/users/new' do
	@page_title = "Sign Up | Quora Clone"
	erb :"users/new"
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

# show user profile page
get '/users/:id' do 
	@page_title = "User Profile | Quora Clone"
 	erb :"users/profile"
end
