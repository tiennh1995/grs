namespace :db do
  desc "Import Genre"
  task genres: [:environment] do
    ["ARPG", "MMORPG", "RPG", "SLG", "Sport", "MOBA"].each do |name|
      Genre.create! name: name
    end
  end
end
