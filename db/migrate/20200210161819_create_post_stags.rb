class CreatePostStags < ActiveRecord::Migration[6.0]
  def change
    create_table :post_stags do |t|
      t.belongs_to :post, null: false
      t.belongs_to :stag, null: false

      t.timestamps
    end
  end
end
