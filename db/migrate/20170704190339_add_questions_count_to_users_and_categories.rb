class AddQuestionsCountToUsersAndCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :questions_count, :integer, default: 0, null: false
    add_column :categories, :questions_count, :integer, default: 0, null: false
  end
end
