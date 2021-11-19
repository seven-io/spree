Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'seven_admin_tab',
  insert_bottom: "[data-hook='admin_tabs']",
  text: "<%= tab :seven,  :url => 'admin/seven/sms', :icon => 'icon-th-large' %>"
)