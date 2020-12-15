class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :spirit
      t.string :ingredients
      t.string :garnish
      t.string :notes
      t.integer :votes
      t.belongs_to :user

      t.timestamps
    end
  end
end
