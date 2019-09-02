class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :image
      t.boolean :active
      t.text :description

      t.timestamps
    end
  end
end
