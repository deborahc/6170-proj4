class AddFieldsToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :subject, :string
    add_column :emails, :message, :text
  end
end
