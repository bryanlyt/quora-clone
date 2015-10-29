class CreateVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
		  t.references :question, index: true      
	    t.references :user, index: true
	    t.boolean :updown

	    t.timestamps null: false
	  end

	  create_table :answer_votes do |t|
		  t.references :answer, index: true       
	    t.references :user, index: true
	    t.boolean :updown

	    t.timestamps null: false
	  end
	end
end
