class FeedController < ApplicationController
  def index
    events = Event.all
    notices = Notice.all
    
    @feed_items = events + notices
    @feed_items.sort_by! {|i| i.created_at}.reverse!
  end
end
