FactoryBot.define do
  factory :item do
    name                  {'あああああ'}
    detail                {'おすすめですよ。最高ですよ。'}
    category_id           {2}
    item_condition_id     {2}
    delivery_condition_id {2}
    prefecture_id         {2}
    reach_date_id         {2}
    price                 {1000}
    
    user

    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end 
