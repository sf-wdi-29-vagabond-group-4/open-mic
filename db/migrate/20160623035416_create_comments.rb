class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :comment
      t.references :user, index: true, foreign_key: true
      t.references :venue, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
