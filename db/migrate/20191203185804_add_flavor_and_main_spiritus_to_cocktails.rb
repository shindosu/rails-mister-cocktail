class AddFlavorAndMainSpiritusToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :flavor, :string
    add_column :cocktails, :main_spiritus, :string
  end
end
