class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :telephone, null: false
      t.string :url, null: false
      t.string :closing_day, null: false
      t.string  :business_hour, null: false
      t.integer :fee, null: false
      t.string :parking_car, null: false
      t.string :parking_bicycle, null: false
      t.string :towel_rental, null: false
      t.string  :water, null: false
      t.string :water_depth, null: false
      t.string :water_quality, null: false
      t.integer :temperature, null: false
      t.string :roryu_status, null: false
      t.string :roryu_time, null: false
      t.string :air_bath, null: false
      t.string :break_place, null: false
      t.string  :television, null: false
      t.string :bgm, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
