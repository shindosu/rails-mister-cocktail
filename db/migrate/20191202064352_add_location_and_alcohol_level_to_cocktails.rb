class AddLocationAndAlcoholLevelToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :alcohol_level, :integer
  end
end
