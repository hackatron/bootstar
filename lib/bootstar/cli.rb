require 'optparse'

module Bootstar
  class CLI

    attr_accessor :params, :action

    def initialize(*args)
      @params = {}
      @action = :output

      OptionParser.new do |opts|
        opts.banner = "Usage: bootstar new"

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        if args.empty?
          puts opts
          exit
        end
      end.parse!(args)

      puts "Bootstar executable..."
    end
  end
end