module ApplicationHelper
  def view_genre genres, genre
    return link_to(genre.code, genre) if genre == genres.last
    link = link_to genre do
      genre.code
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
end
