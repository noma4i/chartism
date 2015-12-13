# WIP

# Chartism for Chartist.js

[Chartist - Simple Responsive Charts](http://gionkunz.github.io/chartist-js/index.html)

Works with Rails

## Installation

```ruby
  gem "chartism", git: "https://github.com/noma4i/chartism"
```

## Usage

Line chart

In the controller:
```ruby
  @chart_data = {
    labels: ['M', 'T', 'W', 'T', 'F'],
    series: [
      [12, 9, 7, 8, 5]
    ]
  }
```

```erb
<%= line_chart @chart_data %>
```

### Global Options

In progress...

## Contributing

- [Report bugs](https://github.com/noma4i/chartism/issues)
- Fix bugs and [submit pull requests](https://github.com/noma4i/chartism/pulls)
- Suggest or add new features

