class AddStatusToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :status, index: true, foreign_key: true
  end
end
