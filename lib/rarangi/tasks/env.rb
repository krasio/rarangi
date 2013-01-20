desc "Setup Rarangi environment"
task :env do
  require 'rarangi'
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  env = ENV["DB"] || Rarangi.env
  ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml'))[env])
end
