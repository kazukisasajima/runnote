class AddPdayToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :pday, :string
  end
end
