class AddCryptopiaToBurse < ActiveRecord::Migration[5.2]
  def change
  end
  Burse.create :name => 'Cryptopia'
end
