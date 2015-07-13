class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.datetime :time, null: false
      t.string :location, null: false
      t.references :interviewer, references: :users, index: true
      t.references :applicant, references: :users, index: true
    end
  end
end
