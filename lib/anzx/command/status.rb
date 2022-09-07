require_relative 'base'

module Anzx
  module Command
    class ControlName < Base
      private

      def is_valid?(input)
        input =~ /^status$/
      end

      def execute(data, input)
        data[:statuses].each_with_index do |status, index|
          puts "#{index+1}. Control Name:\t[#{status.control.name}]
Asset Name:\t\t[#{status.asset_name}]
Status:\t\t\t[#{status.status}]\n\n\n"
        end
      end

    end
  end
end