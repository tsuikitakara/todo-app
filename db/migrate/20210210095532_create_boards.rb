class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :content
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
