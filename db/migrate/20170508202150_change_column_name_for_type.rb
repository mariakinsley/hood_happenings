class ChangeColumnNameForType < ActiveRecord::Migration[5.0]
  def change
     rename_column :posts, :type, :variety
  end
end
