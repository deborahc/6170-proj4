class CreateUropApplications < ActiveRecord::Migration
  def change
    create_table :urop_applications do |t|

      t.timestamps
    end
  end
end
