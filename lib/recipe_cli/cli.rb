require 'rest-client'
require 'json'
require 'dotenv/load'

class EverythingButTheKitchenSink::CLI

#call will be used to run function (will call methods in order of how they should execute)
  def call
    shouldContinue = true
    listEmpty = false
    welcome_message
    enter_ingredients
    while !listEmpty && shouldContinue
      listEmpty = display_recipe_list
      if !listEmpty
        recipe = user_recipe_choice
        display_recipe_time_and_link(recipe)
        shouldContinue = other_options
      end
    end
  end

#will print welcome message
  def welcome_message
    puts "Welcome to Everything but the Kitchen Sink!"
  end

#will prompt/gets ingredients and send to API class
  def enter_ingredients
    puts "\nPlease input your ingredients below. Separate each ingredient with a comma.\n"

    ingredients = gets.strip
    recipes = EverythingButTheKitchenSink::SpoonacularApi.get_recipes(ingredients)
    EverythingButTheKitchenSink::TransformData.get_id_and_title(recipes)
  end

#will print out numbered recipe list
  def display_recipe_list
    if EverythingButTheKitchenSink::Recipe.all.count == 0
      return true
    else
      EverythingButTheKitchenSink::Recipe.all.each_with_index do |recipe, index|
        puts (index + 1).to_s + "." + recipe.title
      end
      return false
    end
  end

#will prompt/gets recipe choice and will send to api. will call Recipe class object to add info
  def user_recipe_choice
    puts "\nWhich recipe would you like to see?\nPlease input the recipe number:\n"

    input = gets.strip
    if valid_recipe_choice(input)
      recipe_index = (input.to_i - 1)

      attributes = EverythingButTheKitchenSink::SpoonacularApi.recipe_info(recipe_index)
      recipe_object = EverythingButTheKitchenSink::Recipe.all[recipe_index]
      EverythingButTheKitchenSink::TransformData.get_time_and_url(attributes, recipe_object)
      recipe_object
    else
      user_recipe_choice
    end
  end

#checks if recipe choice number is valid choice
  def valid_recipe_choice(input)
    input.to_i.between?(1,10)
  end

#will print recipe info (time and link)
  def display_recipe_time_and_link(recipe)
    puts "\nThis meal can be ready in " + recipe.time.to_s + " minutes.\nFor detailed instructions go to: " + recipe.url
  end

#prompt user for other options; will take in yes/no and either loop through or exit function and call leave method
  def other_options
    puts "\nWould you like to see another recipe?\nPlease enter 'Yes' or 'No':"

    input = ""
    while input
      input = gets.strip.upcase
      case input
      when "YES"
        return true
      when "NO"
        puts "\nEnjoy your meal!"
        return false
      else
        puts "\nPlease enter 'Yes' or 'No'."
      end
    end
  end


end
