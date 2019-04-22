class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :glutenFree
      t.boolean :dairyFree
      t.boolean :veryHealthy
      t.boolean :cheap
      t.boolean :popular
      t.boolean :sustainable
      t.boolean :ketogenic
      t.boolean :whole30
      t.integer :weightWatcherPoints
      t.integer :servings
      t.integer :cookTime
      t.integer :likes
      t.integer :readyInMinutes
      t.string :sourceUrl
      t.string :spoontacularUrl
      t.string :name
      t.string :imageUrl
      t.text :instructions

      t.timestamps
    end
  end
end
