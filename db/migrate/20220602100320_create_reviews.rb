class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.float :rating
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
