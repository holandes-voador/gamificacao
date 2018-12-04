class LikesController < ApplicationController
  LIKE_SCORE = 0.1
  def like_event
    @user = current_user
    @event = params[:event_id]

    @like = Like.find_by(user: @user, event_id: @event)

    return 400 if @like

    @like = Like.new(user: @user, event_id: @event)

    respond_to do |format|
      if @like.save
        @user.score = @user.score + LIKE_SCORE
        @user.save!
        format.html { redirect_to feed_index_path, notice: 'Liked the event!!' } and return
        # format.json { render json: 'Like for event created', status: :created }
      else
        format.html { redirect_to feed_index_path, notice: 'Liked fail :(' }
        # format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def like_notice
    @user = current_user
    @notice = params[:notice_id]

    @like = Like.find_by(user: @user, notice_id: @notice)

    return 400 if @like

    @like = Like.new(user: @user, notice_id: @notice)

    respond_to do |format|
      if @like.save
        @user.score = @user.score + LIKE_SCORE
        @user.save!

        format.html { redirect_to feed_index_path, notice: 'Liked the notice!!' } and return
        # format.json { render json: 'Like for notice created', status: :created }
      else
        format.html { redirect_to feed_index_path, notice: 'Liked fail :(' }
        # format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end
end
