class CreateAttrKeys < ActiveRecord::Migration
  def change
    create_table :attr_keys do |t|
      t.string :name
      t.boolean :grouping
      t.boolean :fixed

      t.timestamps
    end

    change_table :medium_infos do |t|
      t.references :attr_keys
    end

    remove_column :medium_infos, :attr_key

  end
end
