class EverythingButTheKitchenSink::SpoonacularApi

#send ingredients to API to get recipes
  def self.get_recipes(ingredients)
    url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=#{ENV['API_KEY']}&ingredients=" + ingredients
    response = RestClient.get(url, headers={})
    recipes = JSON.parse(response)
  end

#will send recipe id to API to get additional info
  def self.recipe_info(recipe_index)
    recipe_object = EverythingButTheKitchenSink::Recipe.all[recipe_index]
    recipe_id = recipe_object.id
    url = "https://api.spoonacular.com/recipes/#{recipe_id}/information?apiKey=#{ENV['API_KEY']}&includeNutrition=true."
    response = RestClient.get(url, headers={})
    attributes = JSON.parse(response)
  end

end
