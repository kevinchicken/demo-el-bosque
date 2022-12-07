# frozen_string_literal: true

# News controller containg methods to deliver news and news pages to the mobile app
class Api::NewsController < Api::BaseController
  before_action :after_login

  def pages_info(page)
    render json: { success: true,
                   news: News.index(page),
                   current_page: News.current(page),
                   next_page: News.next(page),
                   previous_page: News.previous(page),
                   first_page?: News.first?(page),
                   last_page?: News.last?(page) }
  end

  def pages
    page = params[:page]
    pages_info(page)
  end

  def show
    render json: { sucess: true,
                   new: News.find(params[:news_id]) }
  end
end
