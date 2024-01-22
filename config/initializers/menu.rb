Rails.application.config.after_initialize do
  Rails.application.config.spree_backend.main_menu.add(
    Spree::Admin::MainMenu::SectionBuilder
      .new('seven', 'envelope.svg')
      .with_label_translation_key('seven.name')
      .with_items(
        [
          Spree::Admin::MainMenu::ItemBuilder.new('seven.sms', '/admin/seven/sms')
                                             .build,
          Spree::Admin::MainMenu::ItemBuilder.new('seven.settings', '/admin/seven_settings/edit')
                                             .build
        ]
      )
      .build
  )

end
