class Api::NewsController < Api::BaseController
  before_action :after_login

  def news_pages(page)
    render json: { success: true,
                   news: News.index(page),
                   current_page: News.current(page),
                   next_page: News.next(page),
                   previous_page: News.previous(page),
                   first_page?: News.first?(page),
                   last_page?: News.last?(page) }
  end

  def news_index
    page = params[:page]
    news_pages(page)
  end
end
