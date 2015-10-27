class CreateUsers < ActiveRecord::Migration

	def change
		create_table :users do |t|
			t.string :username
			t.string :fullname
			t.string :email
			t.string :password
	end
end



# class User < ActiveRecord::Base
# 	# eg: User.authenticate('hello@gmail.com', 'thisismypassword')

# 	def self.authenticate(email, password)
# 	# if email and password correspond to a valid user, return that user
# 	# otherwise, return nil

# 	end
# end