class DropStudentsTable < ActiveRecord::Migration
  def up
    drop_table :students
    drop_table :supervisors
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
