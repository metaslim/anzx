require 'json'
require_relative 'base_loader'

module Anzx
  module Loader
    class JsonLoader < BaseLoader
      class << self

        private
        def parse(json)
          items = JSON.parse(json)
          yield(items) if block_given?
        end

      end
    end
  end
end