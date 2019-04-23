
require 'byebug'
require 'rest-client'

# You will want to run this seed file 3 or 4 times. Please keep track or your
# API call limitations, and any costs you will incur if you make too many requests

API_KEY = '' # Your API Key here

recipeData = RestClient.get("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=100", {'X-RapidAPI-Key': API_KEY, accept: :json})

# binding.pry
parsedRecipe = JSON.parse(recipeData)

recipes = parsedRecipe["recipes"]

recipes.each do |recipe|
  name = recipe["title"]
  readyInMinutes = recipe["image"]
  cookTime = recipe["cookingMinutes"]
  instructions = recipe["instructions"]
  readyInMinutes = recipe["readyInMinutes"]
  imageUrl = recipe["image"]
  sourceUrl = recipe["sourceUrl"]
  spoontacularUrl = recipe["spoonacularSourceUrl"]
  servings = recipe["servings"]
  whole30 = recipe["whole30"]
  ketogenic = recipe["ketogenic"]
  dairyFree = recipe["dairyFree"]
  glutenFree = recipe["glutenFree"]
  vegan = recipe["vegan"]
  vegetarian = recipe["vegetarian"]
  veryHealthy = recipe["veryHealthy"]
  ingredients = recipe["extendedIngredients"]

  recipe = Recipe.create(name: name, readyInMinutes: readyInMinutes, instructions: instructions, sourceUrl: sourceUrl, servings: servings, whole30: whole30, ketogenic: ketogenic, dairyFree: dairyFree, glutenFree: glutenFree, vegan: vegan, vegetarian: vegetarian, veryHealthy: veryHealthy, cookTime: cookTime, imageUrl: imageUrl)

  ingredients.each do |ingredient|
    name = ingredient["name"]
    imageUrl = ingredient["image"]
    original_string = ingredient["originalString"]
    unit = ingredient["unit"]
    amount = ingredient["amount"]

    ingredient = Ingredient.find_or_create_by(name: name)
    ingredient.update(imageUrl: imageUrl)

    RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id, unit: unit, amount: amount, original_string: original_string)
  end
end

puts "created #{Recipe.all.length} recipes, #{Ingredient.all.length} ingredients, #{RecipeIngredient.all.length} joins"
