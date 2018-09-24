class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.string :name
      t.belongs_to :state, foreign_key: true

      t.timestamps
    end
  end
end
