class AddSupervisoridToUropApplication < ActiveRecord::Migration
  def change
    add_column :urop_applications, :supervisor_id, :integer
  end
end
