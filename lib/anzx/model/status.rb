module Anzx
    module Model
      class Status
        attr_accessor :control, :asset_name, :status

        class << self
          def create(generic_control_id, asset_name, status)
            generic_control = Anzx::Model::Control.get(generic_control_id)
            return new(generic_control, asset_name, status) unless generic_control.nil?
          end
        end

        def initialize(generic_control, asset_name, status)
          @control = generic_control
          @asset_name = asset_name
          @status = status
        end
      end
    end
  end
  