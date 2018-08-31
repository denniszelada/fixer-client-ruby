# frozen_string_literal: true

module Spider
  module Frankfurter
    module Repositories
      # Exchange rate Repository
      class ExchangeRate

        def save(base:, date:, exchange_currencies:)
          exchange_rates = map_exchange_rates(base: base, date: date, exchange_currencies: exchange_currencies)
          stored_exchange_rates = model.create(exchange_rates)
          stored_exchange_rates.id
        end

        private

        def map_exchange_rates(base:, date:, exchange_currencies:)
          exchange_rates = {}
          exchange_rates["created_at"] = Time.now
          exchange_rates["date"]       = date
          exchange_rates["base"]       = base
          exchange_rates.merge!(exchange_currencies.sort.to_h)
          exchange_rates
        end

        def model
          Spider::Frankfurter::Models::ExchangeRate
        end
      end
    end
  end
end
