process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
  })
)


module.exports = environment.toWebpackConfig()
