require_relative 'json_loader'
require_relative '../model/control'
require_relative '../model/status'

module Anzx
  module Loader
    class ControlLoader < JsonLoader
      class << self
        private

        def generate(json)
          controls = []
          statuses = []

          parse(json) do |node|
            controls = generate_controls(node["Controls"])
            statuses = generate_statuses(node["Statuses"])
          end

          {controls: controls, statuses: statuses}

        end
      

        def generate_controls(controls)
          control_objects = []
          controls.each do|control|
            control_objects << Anzx::Model::Control.create(
              control["Generic Control ID"],
              control["Control Name"],
              control["Control Group (Level 1)"],
              control["Control Group (Level 2)"],
              control["Updated At"]
            )
          end

          control_objects
        end

        def generate_statuses(statuses)
          status_objects = []
          statuses.each do|status|
            status_objects << Anzx::Model::Status.create(
              status["Generic Control ID"],
              status["Asset Name"],
              status["Status"],
            )
          end

          status_objects
        end

      end
    end
  end
end
