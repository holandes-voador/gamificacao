class CheckinsController < ApplicationController
  CHECKIN_SCORE = 0.2

  def create
    @event = Event.find_by(id: params[:event_id])
    @user = current_user

    @checkin = Checkin.find_by(event: @event, user: @user)

    redirect_to @event, notice: 'Alredy checked-in to that event' and return if @checkin

    redirect_to @event, notice: 'Cant check-in to passed events' and return if DateTime.now > @event.date

    @checkin = Checkin.new(user: @user, event: @event, date: DateTime.now)

    if @checkin.save
      @user.score = @user.score + CHECKIN_SCORE
      @user.save!
      redirect_to @event, notice: 'Checked-in to the event with success!'
    else
      redirect_to @event, notice: 'Error when trying to check-in :(' and return
    end
  end
end
