Deface::Override.new(
  virtual_path:  'spree/admin/shared/sub_menu/_configuration',
  name:          'add_seven_admin_menu_links',
  insert_bottom: "[data-hook='admin_configurations_sidebar_menu']"
) do
  <<~HTML
    <%= configurations_sidebar_menu_item(Spree.t('spree.seven'), 'admin/settings/xxxxx') %>
  HTML
end