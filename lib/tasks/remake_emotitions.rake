namespace :db do
  desc "Import Emotition"
  task emotitions: [:environment] do
    Review.all.each do |review|
      Emotition.create user_id: 1, review: review, emotition_type: :like
      Emotition.create user_id: 2, review: review, emotition_type: :dislike
    end
  end
end
