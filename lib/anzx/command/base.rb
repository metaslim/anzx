require 'json'

module Anzx
  module Command
    class Base
      def run(data, input)
        return unless is_valid?(input)
        begin
          execute(data, input)
        rescue => e
          puts "Caught exception #{e}!"
        end
      end

      private

      def is_valid?(input)
        raise NotImplementedError
      end

      def execute(client, input)
        raise NotImplementedError
      end
    end
  end
end