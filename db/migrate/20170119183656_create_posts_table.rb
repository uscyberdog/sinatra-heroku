class CreatePostsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |table|
      table.string :title
      table.text :content
      table.references :user

      table.timestamps
    end
  end
end
