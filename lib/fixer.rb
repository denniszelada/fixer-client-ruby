# frozen_string_literal: true

require 'httparty'

module Fixer
  #require 'fixer/config'

  class Fix
    include HTTParty
    API_KEY = '94c49fb502e8386615e28526ee044b6c'
    base_uri "http://data.fixer.io/api/latest?access_key=#{API_KEY}"

    def initialize()
      @options = { query: { access_key: API_KEY } }
    end

    def all
      self.class.get('/latest', @options)
    end
  end

  def self.run
    response = Fix.new.all
    if response.success?
      p response
    end
  end

end
