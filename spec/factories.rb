FactoryGirl.define do
  factory :provider do
    sequence(:name) { |e| "provider ##{e}" }
    address 'my address'
    phone '123-123-123'
    frequency 3
    min_order 2
  end
  factory :article do
    sequence(:name) { |e| "name #{e}" }
    description "description example"
    unit "kg"
    trait :provider_with_stock do
      after(:create) do |instance|
        create :catalog, article: instance
      end
    end

    trait :provider_with_no_stock do
      after(:create) do |instance|
        create :catalog, :impossible_order, article: instance
      end
    end
  end
  factory :catalog do
    provider
    article
    price 10_000
    stock 1
    min_quantity 1

    trait :with_stock do
      association :provider, min_order: 3
      min_quantity 3
      stock 6
    end

    trait :impossible_order do
      association :provider, min_order: 99999999
    end

    trait :with_no_stock do
      association :provider, min_order: 6
      min_quantity 3
      stock 5
    end

    trait :limited_by_quantity do
      association :provider, min_order: 3
      stock 4
      min_quantity 5
    end
  end
end
