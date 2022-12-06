class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title, null: false

      t.string :subtitle, null: false
      t.text   :content, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
