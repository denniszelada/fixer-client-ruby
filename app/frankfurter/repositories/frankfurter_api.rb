# frozen_string_literal: true

require 'httparty'

module Spider
  module Frankfurter
    module Repositories
      # Frankfuter API repo
      class FrankfurterApi
        include HTTParty
        base_uri 'http://frankfurter.app/'
      end
    end
  end
end
