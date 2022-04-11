FactoryBot.define do
  factory :purchase_address do
    post_code      { '111-2222' }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    municipalitie  { '大阪市なにわ' }
    address        { '111' }
    building_name  { 'なんでやねんビル' }
    phone_number   { Faker::Number.number(digits: 11) }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
