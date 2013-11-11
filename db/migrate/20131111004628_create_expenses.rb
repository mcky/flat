class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :date
      t.string :title
      t.integer :price

      t.timestamps
    end
  end
end
