class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name,null:false #タグは空白では保存できない。

      t.timestamps
    end
  end
end
