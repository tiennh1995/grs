module ApplicationHelper
  def view_genre genres, genre
    if genre == genres.last
      if current_user && current_user.admin?
        return link_to genre.code, [:admin, genre]
      else
        return link_to genre.code, genre
      end
    end

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

  def check_genre_list genre_ids, genre_id
    (genre_ids && genre_ids.include?(genre_id)) ? true : false
  end

  def link_to_add_fields name, f, association
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to name.html_safe, "#", class: "add_fields",
      data: {id: id, fields: fields.gsub("\n", "")}
  end

  def link_to_remove_fields name, f
    f.hidden_field(:_destroy) + link_to(name.html_safe, "#",
      class: "remove_fields")
  end
end
