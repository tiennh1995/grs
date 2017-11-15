module ApplicationHelper
  def view_genre genres, genre
    return link_to(genre.code, genre) if genre == genres.last
    link = if current_user && current_user.admin?
      link_to genre.code, [:admin, genre]
    else
      link_to genre.code, genre
    end
    link += ","
  end

  def check_opacity review, type
    "emotition-opacity" if current_user && current_user.send(type, review)
  end

  def view_reply_comment reply_comment
    reply_user = reply_comment.reply_user
    if reply_user && reply_user != reply_comment.user
      link_to(("<b>" + reply_user.nick_name + "</b>").html_safe, reply_user) +
        " " + reply_comment.content
    else
      reply_comment.content
    end
  end

  def check_genre_list genres, genre_ids, genre
    if genres.include?(genre) ||
      (genre_ids && genre_ids.include?(genre.id.to_s))
      true
    else
      false
    end
  end
end
