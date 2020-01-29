class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.belongs_to :post, null: false
      t.integer :rtype

      t.timestamps
    end
  end
end
