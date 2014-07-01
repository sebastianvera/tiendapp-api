if Rails.env.development?
  require 'factory_girl'

  namespace :dev do
    desc 'Seed data for development environment'
    task prime: 'db:setup' do
      # FactoryGirl.find_definitions
      include FactoryGirl::Syntax::Methods

      provider = create(:provider)
      4.times { create(:catalog, :impossible_order, provider: provider) }
      7.times { create(:catalog, :with_stock, provider: provider) }
      provider = create(:provider, min_order: 4)
      5.times { create(:catalog, :limited_by_quantity, provider: provider) }
      6.times { create(:catalog, :with_no_stock, provider: provider) }
      8.times { create(:catalog, :with_stock, provider: provider) }
      Article.take(15).each do |article|
        create(:inventory, article: article)
      end
    end
  end
end
