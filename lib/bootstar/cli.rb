require 'thor'
require 'bootstar'

module Bootstar
  class CLI < Thor
    desc 'new APP_NAME', 'Create a new basic bootstar app'
    def new(name)
      Dir.mkdir(File.join('.', name))
      Dir.chdir(File.join('.', name))
      %w(api client ruby).each { |dir| Dir.mkdir(File.join('.', "#{name}-#{dir}")) }

      new_api(name)
    end

    no_tasks do
      def cyan; "\033[36m" end
      def clear; "\033[0m" end
      def bold; "\033[1m" end
      def red; "\033[31m" end
      def green; "\033[32m" end
      def yellow; "\033[33m" end

      def new_api(name, recipes = [])
        puts
        puts
        puts "#{bold}Generating and Running Template...#{clear}"
        puts
        file = Tempfile.new('template')
        template = RailsWizard::Template.new(recipes)
        file.write template.compile
        file.close
        system %Q(
          cd #{name}-api
          rails-api new . -m #{file.path} #{template.args.join(' ')}
        )
      ensure
        file.unlink
      end
    end
  end
end
