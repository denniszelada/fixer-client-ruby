# frozen_string_literal: true

class Settings
  class << self
    def database_url
      @database_url ||= ENV['DATABASE_URL']
    end
  end
end
