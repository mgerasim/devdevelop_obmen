class AddPoloniexToBurse < ActiveRecord::Migration[5.2]
  def change
  end
  Burse.create :name => 'Poloniex'   
end
