# frozen_string_literal: true

# Class news delivers news pages
class News < ApplicationRecord
  has_rich_text :content
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :content, presence: true
  validates :image, presence: true

  class << self
    def index(page)
      newest_news_ordered(page)
    end

    def current(page)
      newest_news_ordered(page).current_page
    end

    def next(page)
      newest_news_ordered(page).next_page
    end

    def previous(page)
      newest_news_ordered(page).prev_page
    end

    def first?(page)
      newest_news_ordered(page).first_page?
    end

    def last?(page)
      newest_news_ordered(page).last_page?
    end

    def newest_news_ordered(page)
      order(created_at: :desc).page(page)
    end
  end
end
