require 'spec_helper'

describe 'App creation' do
  context 'bootstar new' do
    before(:each) do
      system('bootstar new test-app')
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
