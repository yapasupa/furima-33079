FactoryBot.define do
  factory :item do
      name                  {'山田太郎'}
      text                  {'有り難う'}
      category_id           {2}
      state_id              {2}
      delivery_fee_id       {2}          
      delivery_area_id      {2}
      price                 {300}
      delivery_date_id      {2}
      association :user
      
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
    end
end



