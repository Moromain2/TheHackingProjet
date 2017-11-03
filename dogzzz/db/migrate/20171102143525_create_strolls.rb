class CreateStrolls < ActiveRecord::Migration[5.1]
  def change
    create_table :strolls do |t|
      t.integer :dog_id
      t.integer :dogsitter_id

      t.timestamps
    end
  end
end
