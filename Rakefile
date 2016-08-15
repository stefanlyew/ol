require './config/environment'
require './app'
require 'open-uri'
require 'sinatra/activerecord/rake'

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
  puts "no rspec available"
end

namespace :data do
  task :fetch do
    uri = 'https://s3.amazonaws.com/ownlocal-engineering/engineering_project_businesses.csv.gz'
    download_and_unzip_file_from(uri)
  end

  task :import do
    filename = 'libassets/businesses.csv'
    batch_import_records_from_csv(filename) 
  end
end

def download_and_unzip_file_from(uri)
  source = open(uri)
  gz = Zlib::GzipReader.new(source) 
  result = gz.read

  Dir.mkdir('libassets') unless File.exists?('libassets')
  File.open('libassets/businesses.csv', 'w') do |file|
    file.write(result)
  end
end

def batch_import_records_from_csv(filename) 
  SmarterCSV.process(filename, { chunk_size: 5000 }) do |chunk|
    puts "processing rows #{chunk.first[:id]} - #{chunk.last[:id]}"
    businesses = chunk.map { |row| Business.new(row) }
    Business.import( businesses )
  end
end
