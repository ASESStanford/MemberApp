class AddUserRelToAppForms < ActiveRecord::Migration
  def change
  	add_reference :application_forms, :user, index: true
  	add_foreign_key :application_forms, :users
  end
end
