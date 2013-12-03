class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :github_name
      t.datetime :scrape_time

      t.timestamps
    end
  end
end
