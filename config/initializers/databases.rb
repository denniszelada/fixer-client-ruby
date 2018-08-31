# frozen_string_literal: true

require 'sequel'

MAX_TRIES = 100

# rubocop:disable Style/RescueStandardError
connection_tries ||= 0
begin
  DB = Sequel.connect(Settings.database_url)
rescue => e # Sequel::DtabaseConnectionError
  raise e unless connection_tries < MAX_TRIES
  connection_tries += 1
  sleep 5
  puts "Retry to obtain datase connection - #{connection_tries}"
  retry
end
# rubocop:enable Style/RescueStandardError
