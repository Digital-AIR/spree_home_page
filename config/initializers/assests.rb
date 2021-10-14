Rails.application.config.assets.precompile << 'spree_home_page_manifest.js'

Rails.application.config.assets.configure do |env|
    env.export_concurrent = false
  end