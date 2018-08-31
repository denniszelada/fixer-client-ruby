# frozen_string_literal: true
Sequel.migration do
  change do
    create_table(:exchange_rates) do
      primary_key :id

      DateTime  :created_at,   null: false

      Date      :date,         null: false
      String    :base,         null: false
      Float     :AUD
      Float     :BGN
      Float     :BRL
      Float     :CAD
      Float     :CHF
      Float     :CNY
      Float     :CZK
      Float     :DKK
      Float     :GBP
      Float     :HKD
      Float     :HRK
      Float     :HUF
      Float     :ISK
      Float     :IDR
      Float     :ILS
      Float     :INR
      Float     :JPY
      Float     :KRW
      Float     :MXN
      Float     :MYR
      Float     :NOK
      Float     :NZD
      Float     :PHP
      Float     :PLN
      Float     :RON
      Float     :RUB
      Float     :SEK
      Float     :SGD
      Float     :THB
      Float     :TRY
      Float     :USD
      Float     :ZAR
    end
  end
end
