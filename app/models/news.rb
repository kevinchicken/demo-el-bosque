class News < ApplicationRecord
  def self.index(page)
    News.order(created_at: :desc).page(page)
  end

  def self.current(page)
    News.order(created_at: :desc).page(page).current_page
  end

  def self.next(page)
    News.order(created_at: :desc).page(page).next_page
  end

  def self.previous(page)
    News.order(created_at: :desc).page(page).prev_page
  end

  def self.first?(page)
    News.order(created_at: :desc).page(page).first_page?
  end

  def self.last?(page)
    News.order(created_at: :desc).page(page).last_page?
  end
end
