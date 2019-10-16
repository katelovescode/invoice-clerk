# spec/web/features/add_invoice_spec.rb
require 'features_helper'

RSpec.describe 'Add a invoice' do
  after do
    InvoiceRepository.new.clear
  end

  it 'can create a new invoice' do
    visit '/invoices/new'

    within 'form#invoice-form' do
      fill_in 'Amount',  with: '400.00'

      click_button 'Create'
    end

    expect(page).to have_current_path('/invoices')
    expect(page).to have_content('Create a new invoice')
  end

  it 'displays list of errors when params contains errors' do
    visit '/invoices/new'

    within 'form#invoice-form' do
      click_button 'Create'
    end

    expect(current_path).to eq('/invoices')

    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('Amount must be filled')
  end
end