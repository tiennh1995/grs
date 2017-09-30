namespace :db do
  desc "Import Game"
  task games: [:environment] do
    Genre.all.each_with_index do |genre, index|
      name  = Faker::Name.name
      game = Game.create! name: name,
        avatar: Rails.root.join("app/assets/images/#{index + 1}.jpg").open
      genre.game_genres.create! game: game
    end
  end
end
