require("rspec")
require("pg")
require("project")
require("volunteer")
require("pry")

DB = PG.connect({:dbname => "volunteer_tracker_test"})


RSpec.configure do |config|
  config.after(:each) do
    DB.exec("TRUNCATE projects, volunteers *;")
  end
end
