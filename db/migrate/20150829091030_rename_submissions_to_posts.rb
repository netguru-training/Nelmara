class RenameSubmissionsToPosts < ActiveRecord::Migration
  def change
    rename_table :submissions, :posts
  end
end
