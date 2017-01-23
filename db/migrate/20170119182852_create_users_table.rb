class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :username

      t.timestamps
    end
  end
end
