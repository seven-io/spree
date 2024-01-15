Rails.application.config.after_initialize do
  include Spree::Core::Engine.routes.url_helpers

  Rails.application.config.spree_backend.actions[:user].add(
    Spree::Admin::Actions::ActionBuilder.new('spree_seven.sms', -> (resource) {
      puts Rails.application.config.action_mailer.default_url_options.to_yaml

      admin_seven_sms_url(user_id: resource.id, only_path: true)
    }).
      with_icon_key('envelope.svg').
      with_style(Spree::Admin::Actions::ActionStyle::SECONDARY).
      with_method(:post).
      build
  # Spree::Admin::Actions::ActionBuilder.new('spree_seven.sms', '/admin/seven/sms').
  )
end