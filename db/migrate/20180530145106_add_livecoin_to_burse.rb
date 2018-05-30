class AddLivecoinToBurse < ActiveRecord::Migration[5.2]
  def change
  end
  Burse.create :name => 'Livecoin'
end
