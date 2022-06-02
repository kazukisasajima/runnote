class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      
      t.string :menu
      t.string :time
      t.text :detail
      t.datetime :start_time

      t.timestamps
    end
  end
end
