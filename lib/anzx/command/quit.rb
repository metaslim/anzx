require_relative 'base'

module Anzx
  module Command
    class Quit < Base
      private

      def is_valid?(input)
        input =~ /^quit$/
      end

      def execute(data, input)
        exit(0)
      end
    end
  end
end