class RemoveCorseFromCryptocurrency < ActiveRecord::Migration[5.2]
  def change
    remove_column :cryptocurrencies, :course, :float
  end
end
