class CommentsController < ApplicationController
  COMMENT_SCORE = 0.1
  def create
    @user = current_user

    if params[:event_id]
      @item = Event.find_by(id: params[:event_id])
      @comment = Comment.new(event: @item)
    elsif params[:notice_id]
      @item = Notice.find_by(id: params[:notice_id])
      @comment = Comment.new(notice: @item)
    else
      raise ArgumentError, 'No id for event or notice provided'
    end

    @comment.user = @user

    respond_to do |format|
      if @comment.save
        @user.score = @user.score + COMMENT_SCORE
        format.html { redirect_to @item, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end

    if @comment.save!

    else

    end
  end

end
