require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      1.times do |n|
        @category.products.create!(
          name: Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "Can navigate to a products page" do
      # ACT
      visit root_path

      expect(page).to have_css 'article.product', count: 1
      sleep(4)

      page.find('article header').click
      sleep(2)

      # EACH PRODUCT HAS THE CATEGORY ON THE PAGE
      expect(page).to have_content 'Apparel'

      # PRODUCT PRICE IS HARD CODED
      expect(page).to have_content '$64.99'

      # DEBUG / VERIFY
      save_screenshot
    end
end
