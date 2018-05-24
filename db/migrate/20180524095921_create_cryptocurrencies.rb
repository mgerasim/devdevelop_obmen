class CreateCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptocurrencies do |t|
      t.string :currency
      t.string :name
      t.float :course

      t.timestamps
    end
  end
end
