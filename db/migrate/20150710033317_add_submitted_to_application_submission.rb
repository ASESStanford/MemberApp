class AddSubmittedToApplicationSubmission < ActiveRecord::Migration
  def change
    add_column :application_submissions, :submitted, :boolean, default: false
  end
end
