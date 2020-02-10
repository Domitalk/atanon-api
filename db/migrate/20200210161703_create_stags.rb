class CreateStags < ActiveRecord::Migration[6.0]
  def change
    create_table :stags do |t|
      t.string :stagname

      t.timestamps
    end
  end
end
