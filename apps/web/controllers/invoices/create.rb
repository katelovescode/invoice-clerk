module Web
  module Controllers
    module Invoices
      class Create
        include Web::Action

        expose :invoice

        params do
          required(:invoice).schema do
            required(:amount).filled(:decimal?)
          end
        end

        def call(params)
          if params.valid?
            @invoice = InvoiceRepository.new.create(params[:invoice])

            redirect_to routes.invoices_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
