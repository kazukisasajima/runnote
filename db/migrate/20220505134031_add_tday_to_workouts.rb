class AddTdayToWorkouts < ActiveRecord::Migration[6.1]
  def change
    add_column :workouts, :tday, :string
  end
end
