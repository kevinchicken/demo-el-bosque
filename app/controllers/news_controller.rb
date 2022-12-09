class NewsController < ApplicationController
  def new
    new = News.new
    respond_to do |format|
      format.html { render :new, locals: { new: new } }
    end
  end

  def create
    new = News.new(params.require(:new).permit(:title, :subtitle, :content, :image))
    respond_to do |format|
      format.html do
      end
    end
    if new.save
      flash[:success] = 'News created successfully'
      redirect_to news_url
    else
      flash.now[:error] = 'News could not be saved'
      render :new, locals: { new: new }
    end
  end
end
