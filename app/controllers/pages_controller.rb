# coding: utf-8
class PagesController < ApplicationController

  def home
    @title = "Главная"
  end

  def about
    @title = "О сайте"
  end
  
  def help
    @title = "Помощь"
  end
  
end