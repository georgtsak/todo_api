class CreateTodoItems < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_items do |t|
      t.text :content
      t.references :todo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
