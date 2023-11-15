FactoryBot.define do
  factory :order_address do
      post_number            {'532-0011'}
      prefecture_id          {2}
      municipality           {'大阪市'}
      street_address         {'淀川区西中島３丁目２−１'}
      building_name          {'ライフスイート西中島１０１'}
      tel_number             {'09011223344'}
      item_id                {1}
      user_id                {1}
      token                  {"tok_abcdefghijk00000000000000000"}
  end
end
