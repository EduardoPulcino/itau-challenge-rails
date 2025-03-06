class CreateTransaction < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.float :value
      t.datetime :transaction_time

      t.timestamps
    end
  end
end
