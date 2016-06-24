class ChangeColumnVenueTable < ActiveRecord::Migration
  def change
    change_table :venues do |t|
      t.change :phone_number, :string
    end
  end
end
