class CreateTableEntries < ActiveRecord::Migration
  def change
    create_table :table_entries do |t|
      t.string :comment
      t.float :duration
      t.datetime :date
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
