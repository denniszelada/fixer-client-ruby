# frozen_string_literal: true

module Spider
  module Frankfurter
    module Repositories
      # Exchange rates 
      class ExchangeRate

        def initialize(exchange_rates)
          @exchante_rates = exchange_rates
        end

        def save

        end

        def save_exchange_currencies(exchange_rates)
          # p 'base'
          base = json_exchange_currencies['base']
          json_exchange_currencies['rates'].each do |key, hash|
            # data_object = Fixer::DataObjects::ExchangeRate.new(hash)
            save_exchange_currency(base: base, date: key, exchange_currencies: hash)
          end
        end

        def save_exchange_currency(base:, date:, exchange_currencies:)
          exchange_rates = exchange_currencies
          exchange_rates[:date] = date
          exchange_rates[:base] = base
        end
      end 
    end
  end
end
