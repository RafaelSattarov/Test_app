# coding: utf-8
class CalendarController < ApplicationController
  
  before_filter :authenticate
  
  def index
    @title = "Календарь"
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @who = (params[:who]).to_i
    @user = current_user
    @shown_month = Date.civil(@year, @month)
    if @who == 1
      @event = @user.events
    else
      @event = Event.all
    end

  end
  
end
