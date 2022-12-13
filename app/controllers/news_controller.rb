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

  def show
    @news = News.find(params[:id])
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

  def destroy
    new = News.find(params[:id])
    new.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'New removed successfully'
        redirect_to root_path
      end
    end
  end

  def carousel
    @news = News.order(created_at: :desc).page params[:page]
  end
end
