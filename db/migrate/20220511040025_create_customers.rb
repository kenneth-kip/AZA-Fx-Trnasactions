class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :name
      t.string :email, null: false

      t.timestamps
    end
  end
end
