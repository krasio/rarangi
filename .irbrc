require "bundler"
Bundler.setup
require "rarangi"
Rarangi.init(YAML::load(File.open('config/database.yml'))[Rarangi.env])
