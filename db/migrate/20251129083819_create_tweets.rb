class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.string  :subject,       null: false
      t.text    :text,          null: false
      t.integer :category_id,   null: false
      t.integer :duration_id,   null: false
      t.integer :intensity_id,  null: false
      t.integer :rating_id,     null: false
      t.date    :activity_date, null: false
      t.references :user,       null: false
      # , foreign_key: true

      t.timestamps
    end
  end
end