require 'rails_wizard'

Dir[File.dirname(__FILE__) + '/../../recipes/*.rb'].each do |path|
  key = File.basename(path, '.rb')
  recipe = RailsWizard::Recipe.generate(key, File.open(path))
  RailsWizard::Recipes.add(recipe)
end