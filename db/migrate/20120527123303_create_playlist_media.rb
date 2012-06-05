class CreatePlaylistMedia < ActiveRecord::Migration
  def change
    create_table :playlist_media do |t|
      t.references :playlist
      t.references :medium
      t.timestamps
    end
  end
end
