namespace :db do
  desc "Import Genre"
  task genres: [:environment] do
    [["MMORPG", "Game nhập vai trực tuyến nhiều người chơi"],
    ["MOBA", "Game mô phỏng các trận chiến"],
    ["MMORTS", "Game online chiến thuật thời gian thực"],
    ["MMOFPS", "Game online bắn súng trực tuyến"],
    ["MMOSG", "Game thể thao trực tuyến"],
    ["MMOR", "Game đua xe trực tuyến"]].each do |genre|
      Genre.create! code: genre[0], name: genre[1]
    end
  end
end
