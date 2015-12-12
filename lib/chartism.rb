require 'chartism/version'
require 'chartism/helper'

module Chartism
  class << self
    attr_accessor :options
  end
  self.options = {}

  module Rails
    class Engine < ::Rails::Engine
     initializer 'precompile', group: :all do |app|
        app.config.assets.precompile << proc { |path| path == 'chartism.js' }
      end

      initializer 'helper' do
        ActiveSupport.on_load(:action_view) do
          include Helper
        end
      end
    end
  end
end

module Enumerable
  def chart_json
    if is_a?(Hash) && (key = keys.first) && key.is_a?(Array) && key.size == 2
      group_by { |k, _v| k[0] }.map do |name, data|
        {name: name, data: data.map { |k, v| [k[1], v] }}
      end
    else
      self
    end.to_json
  end
end
