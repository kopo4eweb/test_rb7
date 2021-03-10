class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :sessions, default: 0

      t.timestamps
    end

    add_index :movies, :sessions
  end
end
