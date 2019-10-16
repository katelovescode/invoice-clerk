RSpec.describe Web::Controllers::Invoices::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[invoice: { amount: 1356.00 }] }
  let(:repository) { InvoiceRepository.new }

  before do
    repository.clear
  end

  context 'with valid params' do
    it 'creates a new invoice' do
      action.call(params)
      invoice = repository.last

      expect(invoice.id).to_not be_nil
    end

    it 'redirects the user to the invoices listing' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/invoices')
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[invoice: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:invoice, :amount)).to eq(['is missing'])
    end
  end
end
