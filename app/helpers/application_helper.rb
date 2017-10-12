module ApplicationHelper
  def view_genre genres, genre
    return link_to(genre.name, "#") if genre == genres.last
    link = link_to "#" do
      genre.name
    end
    link += ","
  end

  def check_opacity review, type
    "emotition-opacity" if current_user && current_user.send(type, review)
  end
end
