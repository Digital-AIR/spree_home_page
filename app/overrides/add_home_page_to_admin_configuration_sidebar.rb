Deface::Override.new(
  virtual_path: 'spree/admin/shared/sub_menu/_configuration',
  name: 'add_home_page_to_configuration',
  insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
  text: <<-HTML
   <%= configurations_sidebar_menu_item("Home Page Settings", spree.edit_admin_home_page_path(1)) if can? :manage, Spree::HomePage %>
   HTML
)