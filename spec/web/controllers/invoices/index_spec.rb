RSpec.describe Web::Controllers::Invoices::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repository) { InvoiceRepository.new }

  before do
    repository.clear

    @invoice = repository.create(amount: 100.5)
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all invoices' do
    action.call(params)
    expect(action.exposures[:invoices]).to eq([@invoice])
  end
end
