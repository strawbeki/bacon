class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :roll
      t.string :filling
      t.string :sauce
      t.text :notes

      t.timestamps
    end
  end
end
