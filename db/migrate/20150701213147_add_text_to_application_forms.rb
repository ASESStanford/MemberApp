class AddTextToApplicationForms < ActiveRecord::Migration
  def change
    add_column :application_forms, :title, :text
  end
end
