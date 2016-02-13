class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :location
      t.integer :status

      t.timestamps null: false
    end
  end
end
