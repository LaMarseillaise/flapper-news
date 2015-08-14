class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :upvotes, null: false, default: 0
      t.references :post, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
