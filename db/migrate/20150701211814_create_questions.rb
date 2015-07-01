class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :application_form, index: true
      t.text :text

      t.timestamps null: false
    end
    add_foreign_key :questions, :application_forms
  end
end
