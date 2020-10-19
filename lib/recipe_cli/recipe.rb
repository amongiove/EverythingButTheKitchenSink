class EverythingButTheKitchenSink::Recipe

  attr_accessor :id, :title, :url, :time
  @@all = []

  def initialize(recipe_data)
    recipe_data.each {|key, value| self.send(("#{key}="), value)}
    @id = recipe_data[:id]
    @title = recipe_data[:title]
    save
  end

  def additional_recipe_info(recipe_info) # This should be handled using individual setter functions (recipe.setTime / recipe.time = {time})
    @time = recipe_info[:readyInMinutes]
    @url = recipe_info[:sourceUrl]
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
