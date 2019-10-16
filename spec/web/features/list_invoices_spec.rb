# spec/web/features/list_invoices_spec.rb
require 'features_helper'

RSpec.describe 'List invoices' do
  let(:repository) { InvoiceRepository.new }
  before do
    repository.clear

    repository.create(amount: 100.50)
    repository.create(amount: 1035.00)
  end

  it 'displays each invoice on the page' do
    visit '/invoices'

    within '#invoices' do
      expect(page).to have_selector('.invoice', count: 2), 'Expected to find 2 invoices'
    end
  end
end