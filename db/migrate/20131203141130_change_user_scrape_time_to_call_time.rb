class ChangeUserScrapeTimeToCallTime < ActiveRecord::Migration
  def change
    rename_column :users, :scrape_time, :call_time
  end
end
