Deface::Override.new(
  insert_bottom: '[data-hook=\'admin_configurations_sidebar_menu\']',
  name:          'add_seven_admin_menu_links',
  virtual_path:  'spree/admin/shared/sub_menu/_configuration',
) do
  <<~HTML
    <%= configurations_sidebar_menu_item('Seven', edit_admin_seven_settings_path) %>
  HTML
end