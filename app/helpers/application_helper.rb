module ApplicationHelper
  def view_genre genres, genre
    return link_to(genre.name, "#") if genre == genres.last
    link = link_to "#" do
      genre.name
    end
    link += ","
  end
end
