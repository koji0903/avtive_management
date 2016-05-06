class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :item, index: true, foreign_key: true
      t.references :item_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
