class UsersController < ApplicationController
  def show
    @currentUser = current_user
  end
end
