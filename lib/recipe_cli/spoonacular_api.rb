class EverythingButTheKitchenSink::SpoonacularApi

# key = 3705831af10240c595aa20e41ae1f8b5
# key = 786b7fc42de54bfcb1fe1fb99e697d4d

#send ingredients to API to get recipes
  def self.get_recipes(ingredients)
    url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=3705831af10240c595aa20e41ae1f8b5&ingredients=" + ingredients
    response = RestClient.get(url, headers={})
    recipes = JSON.parse(response)
  end

#will send recipe id to API to get additional info
  def self.recipe_info(recipe_index)
    recipe_object = EverythingButTheKitchenSink::Recipe.all[recipe_index]
    recipe_id = recipe_object.id
    url = "https://api.spoonacular.com/recipes/#{recipe_id}/information?apiKey=3705831af10240c595aa20e41ae1f8b5&includeNutrition=true."
    response = RestClient.get(url, headers={})
    attributes = JSON.parse(response)
  end

end
