# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'csv'

module Spider
  module Urparts
    module Workflows
      # Sync module
      module Bot
        module_function

        EXPRESION = "ND[0-9]*\s-(\s(?!ND)[A-Z]*[W?]?)*"
        def run
          catalogue = Nokogiri::HTML(open("https://www.urparts.com/index.cfm/page/catalogue/Ammann/Roller%20Parts/ASC100"))
          parts_text = catalogue.css('div.allparts li').text#.split(/#{EXPRESION}/)
          parts = parts_text.gsub(/\s+/, ' ').strip.split(/#{Spider::Urparts::Workflows::Bot::EXPRESION}/)
          parts.each do |part|
            CSV.open("myfile.csv", "w") do |csv|
              csv << part
            end
          end
        end
      end
    end
  end
end
