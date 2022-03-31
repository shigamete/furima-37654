FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    lastname_full         {'山田'}
    firstname_full        {'太郎'}
    lastname_kana         {'ヤマダ'}
    firstname_kana        {'タロウ'}
    birthday              {'2022 - 3 - 31' }
  end
end
