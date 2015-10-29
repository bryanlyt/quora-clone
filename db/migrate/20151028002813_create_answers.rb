class CreateAnswers < ActiveRecord::Migration
	
	def change
		create_table :answers do |t|
			t.references :user, index: true
			t.references :question, index: true
			t.text :description

			t.timestamps null: false
		end
	end
end
