FactoryGirl.define do

  factory :company do
    name

    factory :company_with_jobs do
      transient do
        jobs_count 2
      end

      after(:create) do |company, evaluator|
        create_list(:job, evaluator.jobs_count, company: company)
      end
    end
  end

  sequence :name do |n|
    "Important Company No. #{n}"
  end

  factory :job do
    title
    level_of_interest 30
    city
  end

  sequence :title do |n|
    "Impressive Job Title No. #{n}"
  end

  sequence :city, ["Denver", "Boulder", "Golden"].cycle do |n|
    "#{n}"
  end
end