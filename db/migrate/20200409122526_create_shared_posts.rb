class CreateSharedPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :shared_posts do |t|
      t.integer :permission
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
