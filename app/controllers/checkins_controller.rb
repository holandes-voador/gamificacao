class CheckinsController < ApplicationController
  CHECKIN_SCORE = 0.2
  PRESENCE_SCORE = 3

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

  def list
    @event = Event.find_by(id: params[:event_id])
    @checkins = @event.checkins
  end

  def check_presence
    @event = Event.find_by(id: params[:event_id])
    @user = current_user
    @checkins = @event.checkins

    @checkin = Checkin.find_by(event: @event, user: @user)
    @checkin.present = params[:present]

    if @checkin.save
      @user.score = @user.score + PRESENCE_SCORE
      @user.save!
      redirect_to event_list_checkins_path(@event), notice: 'Presence saved with success!'
      # render 'checkins/list'
    else
      redirect_to event_list_checkins_path(@event), notice: 'Error when trying to save the presence :(' and return
    end
  end
end
