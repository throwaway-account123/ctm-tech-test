class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.belongs_to :merchant, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
