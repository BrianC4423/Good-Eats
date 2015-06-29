class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :restaurant_id,   null: false
      t.string :rating,          null: false
      t.string :body,            null: false

      t.timestamps
    end
  end
end
