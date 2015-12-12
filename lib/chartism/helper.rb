require 'json'
require 'erb'

module Chartism
  module Helper
    def line_chart(data_source, options = {})
      chartism_chart 'Line', data_source, options
    end

    private

    def chartism_chart(klass, data_source, options)
      @chartism_chart_id ||= 0
      options = chartkick_deep_merge(Chartism.options, options)
      element_id = options.delete(:id) || "chart-#{@chartism_chart_id += 1}"
      height = options.delete(:height) || '300px'

      plugin_labels = <<JS
    Chartist.plugins.ctPointLabels({
      textAnchor: 'middle'
    })
JS

      plugin_zoom = <<JS
    Chartist.plugins.zoom({
      onZoom : function(chart, reset) { storeReset(reset) }
    })
JS
      plugins_threshold = <<JS
    Chartist.plugins.ctThreshold({
      threshold: 2
    })
JS

      plugins = []
      if options[:plugin_labels].present?
        plugins << plugin_labels
      end

      if options[:plugins_threshold].present?
        plugins << plugins_threshold
      end

      html = (options.delete(:html) || %(<div id="%{id}" style="height: %{height}; text-align: center; color: #999; line-height: %{height}; font-size: 14px; font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helvetica, sans-serif;"></div>)) % {id: ERB::Util.html_escape(element_id), height: ERB::Util.html_escape(height)}

      js = <<JS
<script type="text/javascript">
  new Chartist.#{klass}('#chart-#{@chartism_chart_id}', #{data_source.to_json}, {
  showArea: true,
  plugins: [
   #{plugins.join(',')}
  ]
});
</script>
JS
      html += js
      html.respond_to?(:html_safe) ? html.html_safe : html
    end

    def chartkick_deep_merge(hash_a, hash_b)
      hash_a = hash_a.dup
      hash_b.each_pair do |k, v|
        tv = hash_a[k]
        hash_a[k] = tv.is_a?(Hash) && v.is_a?(Hash) ? tv.deep_merge(v) : v
      end
      hash_a
    end
  end
end
