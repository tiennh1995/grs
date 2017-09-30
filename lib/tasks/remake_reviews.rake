namespace :db do
  desc "Import Review"
  task reviews: [:environment] do
    Game.all.each do |game|
      Review.create! game: game, user: User.first, point: 5,
        title: "Review game", content: "This game is very interest!"
    end
  end
end
