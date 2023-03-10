class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.datetime :preparation_time
      t.datetime :cooking_time
      t.string :description
      t.boolean :public
      # t.references :user_id, null: false, foreign_key: true

      t.timestamps
      # add_foreign_key :user, :users, column: :user_id
    end
  end
end
