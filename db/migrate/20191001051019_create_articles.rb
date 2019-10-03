class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :title
      t.text :text
      t.text :image

      t.timestamps
    end
  end
end
