class CreateChefs < ActiveRecord::Migration[7.0]
  def change
    create_table :chefs do |t|
      t.string :details
      t.string :cuisine
      t.datetime :availability, array: true, default: []

      t.timestamps
    end
  end
end
