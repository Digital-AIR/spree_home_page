class AddThumbnailScreenShotTimeInHomepage < ActiveRecord::Migration[6.1]
  def self.up
      add_column :spree_home_pages, :thumbnail_screen_shot_time, :integer, default: 10
  end

  def self.down
      remove_column :spree_home_pages, :thumbnail_screen_shot_time
  end
end
