namespace :db do
  desc "Import Game"
  task games: [:environment] do
    Genre.all.each_with_index do |genre, index|
      name  = Faker::Name.name
      game = Game.create! name: name,
        cover: Rails.root.join("app/assets/images/#{index + 1}.jpg").open,
        info: "<p>Võ lâm truyền kỳ là một trò chơi nhập vai trực tuyến nhiều người chơi (MMORPG) được Việt hóa từ trò chơi Kiếm hiệp tình duyên Online (chữ Hán: 剑侠情缘; tiếng Anh: SWORDSMAN Online) của công ty Kingsoft (Kim Sơn) từ Trung Quốc và được VNG phân phối tại Việt Nam. Trò chơi cho phép các người chơi đóng vai dựa theo các tiểu thuyết kiếm hiệp của Trung Quốc. Trò chơi này từng gây cơn sốt ở Trung Quốc và được Hiệp hội Phần mềm Trung Quốc trao giải 'Trò chơi xuất sắc nhất năm 2003'</p>
        <p>Sau khi được Việt hóa giao diện và chuẩn bị các điều kiện cần thiết, trò chơi đã chính thức ra mắt người chơi Việt Nam vào ngày 21 tháng 3 năm 2005. Game đã thu hút được đông đảo người chơi từ rất nhiều ngành nghề: bác sĩ, giáo sư, giáo viên, học sinh, công nhân viên chức, nghệ sĩ nổi tiếng như: Ưng Hoàng Phúc, Tấn Beo, Lam Trường, Xuân Bắc, Ngân Khánh, …. Từ khi ra mắt năm 2005 đến thời điểm cập nhật 04/2014, VLTK đã có tổng cộng gần 20tr người chơi với 86 server trong một thời điểm.</p>
        <p>Một trong những hoạt động tầm cỡ, nổi bật nhất của Võ Lâm Truyền Kỳ là Đại hội Võ Lâm với sự tham gia của hơn 40.000 người vào năm 2005 tại nhà thi đấu Quân khu 7.</p>
        <p>Ngoài các hoạt động trong game, Võ Lâm Truyền Kỳ còn tổ chức thành công cuộc thi Thập Đại Mỹ Nhân và các mỹ nhân đó hiện đang là những nhân vật nổi tiếng như ca sĩ Bảo Thy, diễn viên Ngân Khánh, ca sĩ Bích Ly, hoa hậu Ngọc Hân… Những năm 2008 trở về sau người chơi dần bỏ game VLTK với nhiều lý do riêng! Để lại sự luyến tiếc vô hạn về một kênh giải trí, giao lưu hấp dẫn, và VNG cũng mất một khoản thu phí vô cùng lớn vì lượng người chơi cũng tương đồng với lượng thu nhập của game này. Một trong những nguyên nhân mà game thủ bỏ game là vì VNG đã không tạo được sân chơi công bằng cho những game thủ ít tiền và những người chỉ chơi game bằng tiền! Họ ưu ái cho những người chịu đầu tư 'xu'-vật phẩm phải mua bằng thẻ cào tức tiền của các game thủ. Cứ có tiền là sẽ có một nhân vật mạnh. Cũng có ý kiến rằng sức quản lý của VNG đối với một game hay như VLTK là chưa đủ tầm. Điều này thể hiện khi game thủ có những khiếu nại liên quan đến lỗi game, trễ đường truyền sever của máy chủ mà không được giải quyết thoả đáng.</p>",
          required: "<p><label>OS:</label> Windows 10, 8, 7 (64 bit).</p>
          <p><label>CPU:</label> Intel core i5-3450/ AMD FX 4100.</p>
          <p><label>RAM:</label> 8GB.</p>
          <p><label>Card:</label> NVIDIA GTX 650 / AMD Radeon HD 7750.</p>
          <p><label>Hardware:</label> 30GB</p>"
      genre.game_genres.create! game: game
      (1..3).each do |i|
        Screenshot.create game: game,
          image: Rails.root.join("app/assets/images/#{index + 1}/#{i}.jpg").open
      end
    end

    GameGenre.create game_id: 1, genre_id: 2
    GameGenre.create game_id: 1, genre_id: 3
    GameGenre.create game_id: 2, genre_id: 1
    GameGenre.create game_id: 2, genre_id: 4
    GameGenre.create game_id: 3, genre_id: 1
  end
end
