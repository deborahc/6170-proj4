class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|

      t.timestamps
    end
    add_column :applications, :posting_id, :integer
    add_column :applications, :student_id, :integer
    add_column :applications, :message, :text
  end
end
