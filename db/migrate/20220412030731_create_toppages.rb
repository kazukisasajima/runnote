class CreateToppages < ActiveRecord::Migration[6.1]
  def change
    create_table :toppages do |t|
      t.string :best
      t.string :race
      t.string :target

      t.timestamps
    end
  end
end
