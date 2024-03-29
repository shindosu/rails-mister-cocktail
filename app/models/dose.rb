class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates_uniqueness_of :ingredient_id, :scope => :cocktail_id
  #comparing cocktail_id with ingredient_id
end
