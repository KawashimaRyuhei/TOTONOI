require "csv"

CSV.foreach('db/csv/store_data.csv',headers: true) do |row|
  Store.create!(
    name: row['name'],
    address: row['address'],
    postal_code: row['postal_code'],
    telephone: row['telephone'],
    url: row['url'],
    closing_day: row['closing_day'],
    business_hour: row['business_hour'],
    fee: row['fee'],
    parking_car: row['parking_car'],
    parking_bicycle: row['parking_bicycle'],
    towel_rental: row['towel_rental'],
    water: row['water'],
    water_depth: row['water_depth'],
    water_quality: row['water_quality'],
    temperature: row['temperature'],
    roryu_status: row['roryu_status'],
    roryu_time: row['roryu_time'],
    air_bath: row['air_bath'],
    break_place: row['break_place'],
    television: row['television'],
    bgm: row['bgm'],
    user_id: row['user_id']
  )
end