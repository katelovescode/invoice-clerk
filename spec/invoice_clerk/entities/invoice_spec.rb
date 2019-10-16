RSpec.describe Invoice, type: :entity do
  it 'can be initialized with attributes' do
    invoice = Invoice.new(amount: 12.99)
    expect(invoice.amount).to eq(12.99)
  end
end
