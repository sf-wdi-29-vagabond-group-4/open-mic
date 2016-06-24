class RemoveFullAddressFromVenues < ActiveRecord::Migration
  def change
    remove_column :venues, :full_address, :string
  end
end
