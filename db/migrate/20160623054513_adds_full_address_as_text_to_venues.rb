class AddsFullAddressAsTextToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :full_address, :text
  end
end
