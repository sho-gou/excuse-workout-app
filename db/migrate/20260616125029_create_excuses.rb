class CreateExcuses < ActiveRecord::Migration[7.2]
  def change
    create_table :excuses do |t|
      t.string :name
      t.string :icon_image

      t.timestamps
    end
  end
end
