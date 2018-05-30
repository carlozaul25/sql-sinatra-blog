class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :user do |u|
  		u.string :username
  		u.string :password 
  	end
  end
end
