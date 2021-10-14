class AddInitialHomePages < ActiveRecord::Migration[6.1]
  def up
    1.times do |i|
      Spree::HomePage.create()
    end
  end

  def down
    Spree::HomePage.delete_all
  end
end
