class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :title
      t.string :comment

      t.timestamps null: false
    end
  end
end
