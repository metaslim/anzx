require_relative 'base'

module Anzx
  module Command
    class Help < Base
      private

      def is_valid?(input)
        input =~ /^help$/
      end

      def execute(data, input)
        puts "ENTER COMMAND [control, status, help, quit]"
      end
    end
  end
end