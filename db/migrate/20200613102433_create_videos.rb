class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_url
      t.float :rate
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :videos,[:user_id, :created_at]
  end
end
