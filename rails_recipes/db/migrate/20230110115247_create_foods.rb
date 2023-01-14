class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :meeasurment_unit
      t.decimal :price
      t.float :quantity
      # t.references :user_id, null: false, foreign_key: true
      # t.index ['user_id'], name: 'index_users_on_user_id'

      t.timestamps
    end
  end
end
