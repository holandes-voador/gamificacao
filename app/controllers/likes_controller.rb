class LikesController < ApplicationController
  def like_event
    @user = current_user.id
    @event = params[:event_id]

    @like = Like.find_by(user_id: @user, event_id: @event)

    return 400 if @like

    @like = Like.new(user_id: @user, event_id: @event)

    if @like.save!
      redirect_to feed_index_path
    else
      redirect_to root_path
    end

    respond_to do |format|
      if @like.save
        format.html { redirect_to feed_index_path, notice: 'Liked the event!!' } and return
        # format.json { render json: 'Like for event created', status: :created }
      else
        format.html { redirect_to feed_index_path, notice: 'Liked fail :(' }
        # format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def like_notice
    @user = current_user.id
    @notice = params[:notice_id]

    @like = Like.find_by(user_id: @user, notice_id: @notice)

    return 400 if @like

    @like = Like.new(user_id: @user, notice_id: @notice)

    if @like.save!
      redirect_to feed_index_path
    else
      redirect_to root_path
    end

    respond_to do |format|
      if @like.save
        format.html { redirect_to feed_index_path, notice: 'Liked the notice!!' } and return
        # format.json { render json: 'Like for notice created', status: :created }
      else
        format.html { redirect_to feed_index_path, notice: 'Liked fail :(' }
        # format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end
end
