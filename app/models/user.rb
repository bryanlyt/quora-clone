class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
validates :fullname, presence: true
validates :email, presence: true, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
has_many :questions
has_many :answers
has_many :question_votes
has_many :answer_votes

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
