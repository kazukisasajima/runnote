class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      
      t.string :train
      t.text :result
      t.text :review
      t.datetime :start_time
      t.references :user, null: false, foreign_key: true 
       
      t.timestamps
    end
  end
end
