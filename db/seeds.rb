email = 'admin@example.com'
password = 'password'

unless AdminUser.exists?(email: 'admin@example.com')
  AdminUser.create!(email: email, password: password, password_confirmation: password)
end

MIN_AMOUNT = 10

brands = Array.new(MIN_AMOUNT) { Brand.create!(name: FFaker::Product.brand) }

machine_types = MIN_AMOUNT.times.map do
  MachineType.create!(code: FFaker::Product.model, country: FFaker::Address.country,
                      manufactured_at: FFaker::Vehicle.year, brand: brands.sample)
end

repair_types = MIN_AMOUNT.times.map do
  RepairType.create!(code: FFaker::Address.secondary_address, name: FFaker::Music.song, duration: rand(1..365),
                     price: rand(100..100_000), description: FFaker::Book.description)
end

MIN_AMOUNT.times do
  Repair.create!(machine_type: machine_types.sample, repair_type: repair_types.sample,
                 started_at: FFaker::IdentificationESCO.expedition_date,
                 description: FFaker::Book.description)
end
