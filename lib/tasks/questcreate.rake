require 'csv'

namespace :questcreate do
  task :create_quests => :environment do
    CSV.foreach("public/Quest_081801.csv", :headers => true) do |row|
      Quest.create!(row.to_hash)
    end
  end
end
