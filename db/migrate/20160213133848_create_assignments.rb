class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.datetime :date
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
