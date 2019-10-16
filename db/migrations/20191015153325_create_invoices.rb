Hanami::Model.migration do
  change do
    create_table :invoices do
      primary_key :id

      column :amount, BigDecimal

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
