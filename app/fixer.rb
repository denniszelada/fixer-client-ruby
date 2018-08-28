# frozen_string_literal: true

require 'httparty'

module Fixer
  class CurrencyExchange 
    include HTTParty
    base_uri "http://frankfurter.app/"

    def get_time_series(from, to, based = 'EUR')
      self.class.get("/#{from}..#{to}?from=#{based}")
    end
  end

  extend self

  def run
    result = get_exchange_currencies
    parse_exchange_currencies(result)
  end

  def get_exchange_currencies
    response = CurrencyExchange.new().get_time_series('2018-01-01', '2018-08-08')
    if response.success?
      response.body
    end
  end

  def parse_exchange_currencies(currencies)
    JSON.parse(currencies)
  end

  def store_exchange_currencies(exchange_currencies)

  end
end
