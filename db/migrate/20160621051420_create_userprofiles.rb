class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
