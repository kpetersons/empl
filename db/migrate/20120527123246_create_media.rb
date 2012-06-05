class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.references :user
      t.has_attached_file :medium
      t.timestamps
    end
  end
end
