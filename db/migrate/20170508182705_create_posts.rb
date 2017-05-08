class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.datetime :date
      t.string :location
      t.string :type
      t.timestamps
    end
  end
end
