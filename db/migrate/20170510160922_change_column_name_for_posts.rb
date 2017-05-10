class ChangeColumnNameForPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :photo_file_name, :image_file_name
    rename_column :posts, :photo_content_type, :image_content_type
    rename_column :posts, :photo_file_size, :image_file_size
    rename_column :posts, :photo_updated_at, :image_updated_at
  end
end
