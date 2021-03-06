# login user
get '/session/new' do
	@page_title = "Login | Quora Clone"
 	erb :"session/login"
end

# authenticate users
post '/session' do
	@login = User.authenticate(params[:user]["email"], params[:user]["password"])
	case @login
	when "username_invalid"
		@error ="Invalid email entered"
		erb :"session/login"
	when "password_invalid"
		@error ="Invalid password entered for username #{params[:user]["email"]}"
		erb :"session/login"
	else 
		session[:user_id] = @login
		redirect to ('/')
	end	
end

# logout user
get '/session/logout' do
	session[:user_id] = nil
	redirect to ('/')
end

get '/session/loginform' do
	erb :"session/loginform", :layout => false 
end
