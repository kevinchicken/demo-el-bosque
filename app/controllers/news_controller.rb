# frozen_string_literal: true

# News class manages the creation and update for News (only admins are authorized)
class NewsController < ApplicationController
  load_and_authorize_resource
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
      redirect_to root_path
    else
      flash.now[:error] = 'News could not be saved'
      render :new, locals: { new: new }
    end
  end

  def edit
    new = News.find(params[:id])
    respond_to do |format|
      format.html { render :edit, locals: { new: new } }
    end
  end

  def update
    new = News.find(params[:id])
    respond_to do |format|
      format.html do
        binding.pry
        if new.update(params.require(:new).permit(:title, :subtitle, :content, :image))
          flash[:success] = 'News updated successfully'
          redirect_to news_url
        else
          flash.now[:error] = 'Error: News could not be updated successfully'
          render :edit, locals: { new: new }
        end
      end
    end
  end
end
