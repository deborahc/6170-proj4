class DropApplicationsTable < ActiveRecord::Migration
  def up
    drop_table :applications
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
