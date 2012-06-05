class CreateMediumInfos < ActiveRecord::Migration
  def change
    create_table :medium_infos do |t|
      t.references :medium
      t.string :attr_key
      t.string :attr_value
      t.timestamps
    end
  end
end
