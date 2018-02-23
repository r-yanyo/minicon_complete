class EventsController < ApplicationController
  def index
    @event_categories = EventCategory.all
    if !params[:search].blank?
      @events = Event.where(['title LIKE ?', "%#{params[:search]}%"]).page(params[:page]).order('start_at DESC').per(3)
    elsif params[:category] == 'konkatsu'
      @events = Event.where("event_category_id = '1'").page(params[:page]).order('start_at DESC').per(3)
    elsif params[:category] == 'koikatsu'
      @events = Event.where("event_category_id = '2'").page(params[:page]).order('start_at DESC').per(3)
      elsif params[:category] == 'gourmet'
      @events = Event.where("event_category_id = '3'").page(params[:page]).order('start_at DESC').per(3)
      else
      @events = Event.page(params[:page]).order('start_at DESC').per(3)
    end
  end
end
