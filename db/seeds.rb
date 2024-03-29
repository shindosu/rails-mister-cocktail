# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Dose.destroy_all
Ingredient.destroy_all #Destroy first before seed bc u don’t want dulicates
Cocktail.destroy_all 

URL_ingredients = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
URL_cocktails = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"
ingredients_list = open(URL_ingredients).read
cocktails_list = open(URL_cocktails).read

#you can just do open(URL).read instead of doing RestClient because essentially they are the same thing
JSON.parse(ingredients_list)["drinks"].each do |ingredient|
  Ingredient.create!(
    name: ingredient["strIngredient1"]
  )
end

JSON.parse(cocktails_list)["drinks"].each do |cocktail|
  Cocktail.create!(
    name: cocktail["strDrink"],
    image_url: cocktail["strDrinkThumb"],
    alcohol_level: rand(1..5)
  )
end

Cocktail.create!(
  name: "Blue Hawaii",
  flavor: "Fruity",
  image_url: "https://cdn.liquor.com/wp-content/uploads/2019/07/12101312/Blue-Hawaii-720x720-recipe.jpg",
  description: "The Blue Hawaii is a tropical cocktail made of rum, pineapple juice, Blue Curaçao, sweet and sour mix, and sometimes vodka. It should not be confused with the similarly named Blue Hawaiian cocktail that contains creme of coconut instead of sweet and sour mix.",
  alcohol_level: rand(1..5)
)



puts "Finished! Successfully added #{Cocktail.count}"