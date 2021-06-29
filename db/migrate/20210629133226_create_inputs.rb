class CreateInputs < ActiveRecord::Migration[6.1]
  def change
    create_table :inputs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :query
      t.string :result

      t.timestamps
    end
  end
end
