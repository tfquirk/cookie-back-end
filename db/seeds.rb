
require 'byebug'
require 'rest-client'

API_KEY = ''

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

  ingredients.each do |i|
    name = i["name"]
    imageUrl = i["image"]
    original_string = i["originalString"]
    unit = i["unit"]
    amount = i["amount"]

    ingredient = Ingredient.find_or_create_by(name: name)
    ingredient.update(imageUrl: imageUrl)

    RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id, unit: unit, amount: amount, original_string: original_string)
  end
end

puts "created #{Recipe.all.length} recipes, #{Ingredient.all.length} ingredients, #{RecipeIngredient.all.length} joins"
