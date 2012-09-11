require 'thor'

module Bootstar
  class CLI < Thor
    desc 'init APP_NAME', 'Create a new basic bootstar app'
    def init(name)
      Dir.mkdir(File.join('.', name))
      Dir.chdir(File.join('.', name))
      ['api', 'client', 'ruby'].each {|dir| Dir.mkdir(File.join('.', "#{name}-#{dir}"))}
    end
  end
end
