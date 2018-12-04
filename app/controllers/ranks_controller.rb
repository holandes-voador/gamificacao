class RanksController < ApplicationController

  def users_rank
    @users = User.all.order(score: :desc)
  end

end
