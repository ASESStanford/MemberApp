class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :application_submission, index: true
      t.text :text

      t.timestamps null: false
    end
    add_foreign_key :answers, :application_submissions
  end
end
