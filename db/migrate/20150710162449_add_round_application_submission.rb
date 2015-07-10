class AddRoundApplicationSubmission < ActiveRecord::Migration
  def change
  	add_column :application_submissions, :round, :integer, default:1
  end
end
