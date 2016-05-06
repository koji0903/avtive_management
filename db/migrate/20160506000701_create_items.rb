class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :place
      t.string :status
      t.float :number
      t.references :unit, index: true, foreign_key: true
      t.string :description
      t.string :image
      t.date :updated_date
      t.references :updated_person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
