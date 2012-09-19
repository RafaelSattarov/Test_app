# coding: utf-8
class EventsController < ApplicationController
  
  before_filter :authenticate
  
  def index
    @title = "Все события"
    @events = Event.all
    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end

  def show
    @event = Event.find(params[:id])
    @title = @event.name
    respond_to do |format|
      format.html
      format.json { render json: @event }
    end 
  end

  def new
    @title = "Новое событие"
    @event = Event.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  def edit
    @event = Event.find(params[:id])
    @title = @event.name
  end

  def create
    @event = Event.new(params[:event])
    respond_to do |format|
      @event.user_id = current_user.id
      if @event.start_at <= @event.end_at
        if @event.save
          format.html { redirect_to @event }
          format.json { render json: @event, status: :created, location: @event }
          flash[:success] = "Событие успешно создано"
        else
          format.html { render action: "new" }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "new" }
        flash.now[:error] = "Дата окончания события раньше её начала."
      end
    
    end
  end

  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Событие успешно обновлено' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if  @event.user_id == current_user.id or current_user.admin  
      @event.destroy
      respond_to do |format|
        format.html { redirect_to events_url }
        format.json { head :no_content }
      end
      flash[:success] = "Событие успешно удалено"
    end
  end
  
  private
  
    def authenticate
      deny_access unless signed_in?
    end
end
