class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
validates :fullname, presence: true
validates :email, presence: true, uniqueness: true, format: { with: /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Z‌​a-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/i }
has_many :questions
has_many :answers

def self.authenticate(email, password)
	@user = User.find_by(email: email)
	if (@user != nil)
		return @user.id if @user.password == password
		return "password_invalid" if @user.password != password 
	else
		return "username_invalid"
	end
end

end
