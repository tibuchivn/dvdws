class CreateTungTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tung_tests do |t|
      t.string :test_column

      t.timestamps
    end
  end
end
