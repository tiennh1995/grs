namespace :db do
  desc "Import Comment"
  task comments: [:environment] do
    Review.all.each do |review|
      (1..6).each do
        comment = Comment.create user_id: 1, review: review,
          content: "An expert review usually refers to a review written by someone who has tested several peer products or services to identify which offers the best value for money or the best set of features.
            Very good. Thank you!"
        ReplyComment.create user_id: 2, comment: comment, reply_user_id: 1,
          content: "Very good. Thank you!"
      end
    end
  end
end
