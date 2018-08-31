# frozen_string_literal: true

module Spider
  module Frankfurter
    module Workflows
      # Sync module
      module Syncronize
        module_function

        def run
          result = exchange_currencies
          parsed_currencies = parse_exchange_currencies(result)
          save_exchange_rates(parsed_currencies)
        end

        def exchange_currencies
          date_range = date_range('2018-01-01', '2018-08-08')
          response = time_series_currency_exchange(date_range).get_time_series
          response.body if response.success?
        end

        def parse_exchange_currencies(currencies)
          JSON.parse(currencies)
        end

        def save_exchange_rates(exchange_currencies_parsed)
           base = exchange_currencies_parsed['base']
          exchange_currencies_parsed['rates'].each do |key, hash|
            exchange_rate.save(base: base, date: key, exchange_currencies: hash)
          end
        end

        def date_range(start_date, end_date)
          Spider::Frankfurter::Lib::DateRange.new(start_date, end_date)
        end

        def time_series_currency_exchange(date_range)
          Spider::Frankfurter::Repositories::TimeSeriesCurrencyExchange.new(date_range)
        end

        def exchange_rate
          Spider::Frankfurter::Repositories::ExchangeRate.new()
        end
      end
    end
  end
end
