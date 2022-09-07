require_relative 'lib/anzx/loader/control_loader'
require_relative 'lib/anzx/command/loader'
require_relative 'lib/anzx/console/simple'

class Main
    DATA_PATH = 'data/controls.json'

    class << self
      def run
        new.execute
      end
    end

    def execute
      setup_commands
      waiting_for_command
    end

    private
    attr_reader :console
    def initialize
      data = Anzx::Loader::ControlLoader.load_from(File.read(DATA_PATH))
      @console = Anzx::Console::Simple.new(data)
    end

    def setup_commands
      Anzx::Command.constants.each do |k|
        if Anzx::Command.const_get(k).instance_of?(Class) && k.to_s != 'Base'
          console.add_command(Object.const_get("Anzx::Command::#{k.to_s}").new)
        end
      end
    end

    def waiting_for_command
      puts "ENTER COMMAND [control, status, help, quit]"
      loop do
        command = gets
        console.execute command.chomp
      end
    end


end

Main.run