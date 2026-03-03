class AddUserIdToArticles < ActiveRecord::Migration[8.1]
  def change
    add_column :articles, :user_id, :integer
  end
end
