class Cocktail < ApplicationRecord
  SPIRITUS = %w(Absinthe Apple Aquavit Baijiu Bourbon Brandy Cahcaca Canadian Whiskey Genever Gin Grappa Whiskey(Irish) Whiskey(Japanese) Liqueurs Cordial Mezcal Ouzo Pisco Port Bitters(Bitter Liqueurs or Amaros) Rum Whiskey(Rye) Scotch Sherry Whiskey(Tennessee) Tequila Vermouth Vodka).sort
  FLAVORS = %w(Frozen Fruity Hot Savory Sour Spicy Sweet).sort
  LEVELS = (1..5)
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true
  validates :name, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
