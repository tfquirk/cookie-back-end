class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :imageUrl

      t.timestamps
    end
  end
end
