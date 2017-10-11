namespace :db do
  desc "Import Review"
  task reviews: [:environment] do
    Game.all.each do |game|
      Review.create! game: game, user: User.first, point: 5,
        title: "Review game",
        content: "<p>A user review refers to a review written by a user or consumer for a product or a service based on her experience as a user of the reviewed product. Popular sources for consumer reviews are e-commerce sites like Amazon.com or Zappos, and social media sites like TripAdvisor and Yelp. E-commerce sites often have consumer reviews for products and sellers separately. Usually, consumer reviews are in the form of several lines of texts accompanied by a numerical rating. This text is meant to aid in shopping decision of a prospective buyer. A consumer review of a product usually comments on how well the product measures up to expectations based on the specifications provided by the manufacturer or seller. It talks about performance, reliability, quality defects, if any, and value for money. Consumer review, also called 'word of mouth' and 'user generated content' differs from 'marketer generated content' in its evaluation from consumer or user point of view. Often it includes comparative evaluations against competing products. Observations are factual as well as subjective in nature. Consumer review of sellers usually comment on service experienced, and dependability or trustworthiness of the seller. Usually, it comments on factors such as timeliness of delivery, packaging, and correctness of delivered items, shipping charges, return services against promises made, and so on.</p>
          <p>Consumer reviews online have become a major factor in business reputation and brand image due to the popularity of TripAdvisor, Yelp, and online review websites. A negative review can damage the reputation of a business and this has created a new industry of reputation management where companies attempt to remove or hide bad reviews so that more favourable content is found when potential customers do research.</p>
          <p>An expert review usually refers to a review written by someone who has tested several peer products or services to identify which offers the best value for money or the best set of features. An example of this is Amazon Vine. Amazon Vine is a program which was introduced to 'help their fellow customers make informed purchase decisions'. This program is invite-only and is designed to generate reviews for product vendors that Amazon works with.</p>
          <p>A bought review is the system where the creator (usually a company) of a new product pays a reviewer to review his new product.</p>"
      game.point = 5
      game.save
    end
  end
end
