Rails.application.config.after_initialize do
  Rails.application.config.spree_backend.actions[:user].add(
    Spree::Admin::Actions::ActionBuilder.new('seven.sms', -> (resource) {
      include Spree::Core::Engine.routes.url_helpers

      user = Spree::User.find_by(id: resource.id)
      ship_address = user.ship_address
      bill_address = user.bill_address
      ship_phone = ship_address && ship_address['phone'] ? ship_address['phone'] : ''
      bill_phone = bill_address && bill_address['phone'] ? bill_address['phone'] : ''
      to = ship_phone ? ship_phone : bill_phone

      return admin_seven_sms_url(to: to, only_path: true)
    }).
      with_icon_key('envelope.svg').
      with_style(Spree::Admin::Actions::ActionStyle::SECONDARY).
      with_method(:post).
      build
  )
end
