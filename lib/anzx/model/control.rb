require_relative 'registry'

module Anzx
    module Model
      class Control < Registry
        attr_accessor :id, :name, 
        :control_group_level_1, :control_group_level_2, :updated_at

        @registry = {}

        class << self
          def create(generic_control_id, control_name, control_group_level_1, control_group_level_2, updated_at)
            @registry[generic_control_id] || new(generic_control_id, control_name, control_group_level_1, control_group_level_2, updated_at).register
          end
        end
  
        def initialize(generic_control_id, control_name, control_group_level_1, control_group_level_2, updated_at)
          @id = generic_control_id
          @name = control_name
          @control_group_level_1 = control_group_level_1
          @control_group_level_2 = control_group_level_2
          @updated_at = updated_at
        end

      end
    end
  end
  