class AddIsApprovedColToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :is_approved, :boolean
  end
end
