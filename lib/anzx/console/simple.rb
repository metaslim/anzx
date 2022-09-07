module Anzx
  module Console
    class Simple
      attr_reader :commands, :data

      def initialize(data)
        @commands = []
        @data = data
      end

      def add_command(command)
        commands << command
        self
      end

      def execute(input)
        commands.each do |command|
          command.run(data, input)
        end
      end

    end
  end
end