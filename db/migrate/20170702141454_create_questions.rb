class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :title, null: false
      t.text :description, null: false

      t.belongs_to :user, null: false
      t.belongs_to :category

      t.timestamps
    end

    add_foreign_key :questions, :users, on_delete: :cascade
    add_foreign_key :questions, :categories, on_delete: :nullify
  end
end