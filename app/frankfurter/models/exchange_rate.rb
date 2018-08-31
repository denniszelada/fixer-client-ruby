# frozen_string_literal: true

module Spider
  module Frankfurter
    module Models
      # Exchange rates
      class ExchangeRate < Sequel::Model(:exchange_rates)
        # Don't put any business logic here, this is just a skeleton to
        # access the Sequel table
      end
    end
  end
end
