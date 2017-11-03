class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
