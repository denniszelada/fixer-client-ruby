# frozen_string_literal: true

require 'httparty'

module Spider
  module Frankfurter
    module Repositories
      # Time Series from Frankfurter API
      class TimeSeriesCurrencyExchange
        def initialize(date_range)
          @date_range = date_range
        end

        def get_time_series(based = 'EUR')
          params = "/#{@date_range.start_date}..#{@date_range.end_date}?from=#{based}"
          frankfurter_api.get(params)
        end

        def frankfurter_api
          Spider::Frankfurter::Repositories::FrankfurterApi
        end
      end
    end
  end
end
