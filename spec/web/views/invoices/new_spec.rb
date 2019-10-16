RSpec.describe Web::Views::Invoices::New, type: :view do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Amount must be filled']) }
  let(:exposures) { Hash[params: params, format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/invoices/new.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  it 'displays list of errors when params contains errors' do
    expect(rendered).to include('There was a problem with your submission')
    expect(rendered).to include('Amount must be filled')
  end
end
