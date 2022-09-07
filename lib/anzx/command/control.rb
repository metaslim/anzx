require_relative 'base'

module Anzx
  module Command
    class Control < Base
      private

      def is_valid?(input)
        input =~ /^control$/
      end

      def execute(data, input)
        data[:controls].each_with_index do |control, index|
          puts "#{index+1}. Generic Control ID:\t\t[#{control.id}]
Control Name:\t\t\t[#{control.name}]
Control Group (Level 1):\t[#{control.control_group_level_1}]
Control Group (Level 2):\t[#{control.control_group_level_2}]
Updated At:\t\t\t[#{control.updated_at}]\n\n\n"
        end
      end


    end
  end
end