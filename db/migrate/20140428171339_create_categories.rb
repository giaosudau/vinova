class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :display_name
      has_many :articles

      t.timestamps
    end
    
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.decimal :points,
      
  end
end
