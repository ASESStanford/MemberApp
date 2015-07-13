class CreateWrittenRatings < ActiveRecord::Migration
  def change
    create_table :written_ratings do |t|
      t.references :application_submission, index: true
      t.references :user, index: true
      t.text :comment
      t.integer :rating

      t.timestamps null: false
    end
    add_foreign_key :written_ratings, :application_submissions
    add_foreign_key :written_ratings, :users
  end
end
