class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :load_game, only: [:new, :create]
  before_action :load_review, except: [:index, :new, :create]
  before_action :load_popular_games, only: [:index, :show]

  def index
    @reviews = current_user.invole_reviews.includes(:comments, :game)
      .page(params[:page]).per 5
  end

  def new
    @review = Review.new game_id: params[:game_id]
  end

  def create
    @review = current_user.reviews.build review_params
    @review.game = @game
    if @review.save
      flash[:success] = "Create review success."
      redirect_to @review
    else
      respond_to do |format|
        format.html do
          flash[:danger] = "Create review fail!"
          redirect_to root_path
        end
        format.js
      end
    end
  end

  def show
    @comments = @review.comments.includes(:user, :reply_comments).limit 5
    @emotition = current_user ? current_user.emotitions
      .find_by(review: @review) : nil
  end

  def edit
  end

  def update
    @review.update_attributes(review_params) ? flash[:success] = "Update
      review success." : flash[:danger] = "Update review fail!"
    redirect_to @review
  end

  def destroy
    @review.destroy ? flash[:success] = "Delete review success." :
      flash[:danger] = "Delete review fail!"
    redirect_to root_path
  end

  private
  def review_params
    params.require(:review).permit :point, :title, :content
  end

  def load_game
    @game = Game.find_by id: params[:game_id]
    unless @game
      flash[:danger] = "Game not exist!"
      redirect_to root_path
    end
  end

  def load_review
    @review = Review.find_by id: params[:id]
    unless @review
      flash[:danger] = "Review not exist!"
      redirect_to root_path
    end
  end
end
