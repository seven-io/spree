Rails.application.config.after_initialize do
  Rails.application.config.spree_backend.main_menu.add(
    Spree::Admin::MainMenu::SectionBuilder.new('subscriptions', 'inbox-fill.svg').
      with_admin_ability_check(Spree::Subscription).
      with_items(
        Spree::Admin::MainMenu::ItemBuilder.new('active', Spree::Core::Engine.routes.url_helpers.admin_active_subsciptions_path).build,
        Spree::Admin::MainMenu::ItemBuilder.new('expired', Spree::Core::Engine.routes.url_helpers.admin_expired_subsciptions_path).build
      ).
      build
  )
end