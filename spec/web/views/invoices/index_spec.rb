RSpec.describe Web::Views::Invoices::Index, type: :view do
  let(:exposures) { Hash[invoices:[], format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/invoices/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #invoices' do
    expect(view.invoices).to eq(exposures.fetch(:invoices))
  end

  context 'when there are no invoices' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder">There are no invoices yet.</p>')
    end
  end

  context 'when there are invoices' do
    let(:invoice1)     { Invoice.new(amount: 100.50) }
    let(:invoice2)     { Invoice.new(amount: 1035.00) }
    let(:exposures) { Hash[invoices: [invoice1, invoice2]] }

    it 'lists them all' do
      expect(rendered.scan(/class="invoice"/).length).to eq(2)
      expect(rendered).to include("100.50")
      expect(rendered).to include("1035.00")
      expect(rendered).to include(invoice1.id.to_s)
      expect(rendered).to include(invoice2.id.to_s)
    end

    it 'hides the placeholder message' do
      expect(rendered).to_not include('<p class="placeholder">There are no invoices yet.</p>')
    end
  end
end
