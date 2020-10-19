require 'rspec/autorun'
require_relative '../config/environment.rb'

describe EverythingButTheKitchenSink::CLI do

  let(:cli) {EverythingButTheKitchenSink::CLI.new}
  let(:other_cli) {EverythingButTheKitchenSink::CLI.new}

  describe "#call" do

    describe "#welcome_message" do
      it "welcomes the user" do
        expect($stdout).to receive(:puts).with("Welcome to Everything but the Kitchen Sink!")
        cli.welcome_message
      end
    end

    describe "#enter_ingredients" do
      it "asks user for ingredients" do
        allow(cli).to receive(:gets).and_return("tofu")
        allow(other_cli).to receive(:gets).and_return("tof")

        expect($stdout).to receive(:puts). with("\nPlease input your ingredients below. Separate each ingredient with a comma.\n")
        cli.enter_ingredients
      end
    end

    describe "#display_recipe_list" do
      # it "returns true when the recipe list is empty" do
      #
      #   result = other_cli.display_recipe_list
      #   expect(result).to be(true)
      #   expect($stdout).to receive(:puts). with("Sorry, I couldn't find any recipes with those ingredients.")
      # end

      it "returns false when the recipe list has items" do

        result = cli.display_recipe_list
        expect(result).to be(false)
      end
    end

    describe "#user_recipe_choice" do
      it "asks for user input" do
        allow(cli).to receive(:gets).and_return("1")

        expect($stdout).to receive(:puts). with("\nWhich recipe would you like to see?\nPlease input the recipe number:\n")
        cli.user_recipe_choice
      end

  

    end
  end
end
