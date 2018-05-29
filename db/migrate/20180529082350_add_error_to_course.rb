class AddErrorToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :error, :string
  end
end
