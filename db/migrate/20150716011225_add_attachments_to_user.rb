class AddAttachmentsToUser < ActiveRecord::Migration
  def change
  	add_attachment :users, :image
  	add_attachment :users, :resume
  end
end
