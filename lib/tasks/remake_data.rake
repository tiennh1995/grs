namespace :db do
  desc "Import data"
  task :remake_data do
    puts "**********Reset Database**********"
    Rake::Task["db:migrate:reset"].invoke
    puts "**********Create User**********"
    Rake::Task["db:users"].invoke
    puts "**********Create Genre**********"
    Rake::Task["db:genres"].invoke
    puts "**********Create Game**********"
    Rake::Task["db:games"].invoke
    puts "**********Create Review**********"
    Rake::Task["db:reviews"].invoke
  end
end

