class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :comment
      t.string :sha
      t.datetime :commit_time
      t.references :user, index: true
      t.references :repo, index: true

      t.timestamps
    end
  end
end
