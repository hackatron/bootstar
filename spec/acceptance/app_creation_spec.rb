require 'spec_helper'

describe 'App creation' do
  context 'bootstar init' do
    before(:all) do
      system('bootstar init test-app')
    end

    after(:all) do
      system('rm -rf test-app')
    end

    it 'should create folder with the app name' do
      File.directory?('./test-app').should be_true
    end

    it 'should create a directory for the API' do
      File.directory?('./test-app/test-app-api').should be_true
    end

    it 'should create a directory for the client' do
      File.directory?('./test-app/test-app-client').should be_true
    end

    it 'should create a directory for the API wrapper gem' do
      File.directory?('./test-app/test-app-ruby').should be_true
    end
  end
end
