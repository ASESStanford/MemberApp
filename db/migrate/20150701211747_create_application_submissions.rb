class CreateApplicationSubmissions < ActiveRecord::Migration
  def change
    create_table :application_submissions do |t|
      t.references :user, index: true
      t.references :application_form, index: true

      t.timestamps null: false
    end
    add_foreign_key :application_submissions, :users
    add_foreign_key :application_submissions, :application_forms
  end
end
