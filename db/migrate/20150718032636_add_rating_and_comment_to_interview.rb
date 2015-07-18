class AddRatingAndCommentToInterview < ActiveRecord::Migration
  def change
    add_column :interviews, :rating, :integer
    add_column :interviews, :comment, :string
  end
end
