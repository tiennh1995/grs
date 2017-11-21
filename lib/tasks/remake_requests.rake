namespace :db do
  desc "Import Request"
  task requests: [:environment] do
    (1..5).each do |index|
      Request.create! user_id: 1, game_name: "Thunderbirds #{index + 1}",
        genre_info: "MMORPG", required: "OS: Win 7 x64",
        info: "Võ lâm truyền kỳ là một trò chơi nhập vai trực tuyến nhiều người chơi (MMORPG)."
    end
  end
end
