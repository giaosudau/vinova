class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.string :title
      t.decimal :points
      t.string :url

      t.timestamps
    end
  end
end
