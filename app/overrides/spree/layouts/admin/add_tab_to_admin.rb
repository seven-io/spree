Deface::Override.new(
  insert_bottom: '[data-hook=\'admin_tabs\']',
  name: 'seven_admin_tab',
  text: "<%= tab :seven,  :url => '/admin/seven/sms', :icon => 'icon-th-large' %>",
  virtual_path: 'spree/layouts/admin',
)