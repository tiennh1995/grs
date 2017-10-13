class EmotitionsController < ApplicationController
  before_action :authenticate_user!, :load_review, :load_emotition

  def create
    @emotition = @review.emotitions.build user: current_user unless @emotition
    @emotition.emotition_type = if @emotition.like? &&
      params[:emotition_type] == :dislike
       :dislike
    elsif @emotition.dislike? && params[:emotition_type] == :like
      :like
    else
      params[:emotition_type]
    end
    @emotition.save
  end

  def destroy
    @emotition.destroy if @emotition
  end

  private
  def authenticate_user!
    unless user_signed_in?
      respond_to do |format|
        format.html
        format.js {render :create}
      end
    end
  end

  def load_review
    @review = Review.find_by id: params[:review_id]
    unless @review
      flash[:danger] = "Review not exist!"
      redirect_to root_path
    end
  end

  def load_emotition
    @emotition = @review.emotitions.find_by user: current_user
  end
end
