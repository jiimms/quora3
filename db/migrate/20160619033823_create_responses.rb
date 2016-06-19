class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :answer
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
