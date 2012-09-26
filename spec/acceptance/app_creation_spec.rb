require 'spec_helper'

describe 'App creation' do
  context 'bootstar new' do
    before(:each) do
      IO.popen('bootstar new test-app', 'r+') do |f|
        s = ''
        while s << f.readchar && !s.match(/Enter your selection\:[^m]*/)
          s = '' if s.split("\n").size > 1

          m = s.match(/(\d+)\)[^P]+PostgreSQL/)
          choice = m[1] if m
        end

        f.puts "#{choice}\n"

        while s << f.readchar && !s.match(/\(y\/n\)[^m]*/)
          s = '' if s.split("\n").size > 1
        end

        f.puts "y\n"        
      end
    end

    after(:each) do
      system('rm -rf test-app')
    end

    it 'should create the default directory structure' do
      File.directory?('./test-app').should be_true
      File.directory?('./test-app/test-app-api').should be_true
      File.directory?('./test-app/test-app-client').should be_true
      File.directory?('./test-app/test-app-ruby').should be_true
    end

    it 'should create the default api service' do
      File.file?('./test-app/test-app-api/config.ru').should be_true
    end
  end
end
