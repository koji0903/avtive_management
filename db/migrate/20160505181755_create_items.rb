class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.string :place
      t.string :status
      t.float :number
      t.references :unit, index: true, foreign_key: true
      t.string :description
      t.string :image

      t.timestamps null: false
    end
  end
end
