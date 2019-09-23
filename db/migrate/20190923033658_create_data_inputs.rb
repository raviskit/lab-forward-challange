class CreateDataInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :data_inputs do |t|
      t.string :data, null: false
      t.string :threshold, null: false
      t.timestamps
    end
  end
end
