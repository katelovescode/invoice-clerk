module Web
  module Controllers
    module Invoices
      class Index
        include Web::Action

        expose :invoices

        def call(params)
          @invoices = InvoiceRepository.new.all
        end
      end
    end
  end
end
