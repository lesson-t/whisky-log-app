# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'chartkick' # @5.0.1
pin 'chart.js' # @4.4.9
pin '@kurkle/color', to: '@kurkle--color.js' # @0.3.4
pin 'chart.js/auto', to: 'chart.js--auto.js' # @4.4.9
