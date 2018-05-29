class CreateBurses < ActiveRecord::Migration[5.2]
  def change
    create_table :burses do |t|
      t.string :name

      t.timestamps
    end 
  	Burse.create :name => 'Bittrex'   
  end
end
