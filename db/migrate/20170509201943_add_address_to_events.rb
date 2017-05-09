class AddAddressToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :streetaddress, :string
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :zip, :string
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end
