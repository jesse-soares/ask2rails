class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.belongs_to :user, null: false
      t.belongs_to :question, null: false
      t.timestamps
    end

    # add fk and indexes
    add_foreign_key :answers, :questions, on_delete: :cascade
    add_foreign_key :answers, :users, on_delete: :cascade
  end
end
