class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      
      # t.string :best
      # t.string :race
      # t.string :target

      t.timestamps
    end
  end
end
