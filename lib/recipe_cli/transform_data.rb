require 'json'

class EverythingButTheKitchenSink::TransformData

  def self.get_id_and_title(recipes)
    if recipes.count == 0
      puts "Sorry, I couldn't find any recipes with those ingredients."
    else
      recipes.each do |recipe|
        recipe_data = {}
        recipe_data[:id] = recipe["id"]
        recipe_data[:title] = recipe["title"]
        EverythingButTheKitchenSink::Recipe.new(recipe_data)
      end
    end
  end

  def self.get_time_and_url(attributes, recipe_object)
    recipe_info = {}
    recipe_info[:readyInMinutes] = attributes["readyInMinutes"]
    recipe_info[:sourceUrl] = attributes["sourceUrl"]
    recipe_object.additional_recipe_info(recipe_info)
  end

end
