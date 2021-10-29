class BadgesController < ApplicationController
  def index
    @badges = Badge.with_user(current_user.id)
  end
end