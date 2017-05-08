class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.datetime :startdate
      t.datetime :enddate
      t.string :location
      t.decimal :cost

      t.timestamps
    end
  end
end
