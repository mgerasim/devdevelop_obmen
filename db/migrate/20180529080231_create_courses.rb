class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :burse, foreign_key: true
      t.references :cryptocurrency, foreign_key: true
      t.float :value
      t.float :diff

      t.timestamps
    end
  end
end
