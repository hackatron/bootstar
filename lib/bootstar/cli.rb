require 'thor'

module Bootstar
  class CLI < Thor
    desc 'new APP_NAME', 'Create a new basic bootstar app'
    def new(name)
      Dir.mkdir(File.join('.', name))
      Dir.chdir(File.join('.', name))
      %w(api client ruby).each { |dir| Dir.mkdir(File.join('.', "#{name}-#{dir}")) }
    end
  end
end
