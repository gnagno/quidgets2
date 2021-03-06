ActionController::Routing::Routes.draw do |map|

  match 'ph_quidgets/checkbox/update' => 'quidgets#quidgets_checkbox_update', :as => :ph_quidgets_checkbox_update

  match 'ph_quidgets/radio_group/update' => 'quidgets#quidgets_radio_group_update', :as => :ph_quidgets_radio_group_update

  match 'ph_quidgets/textbox/update' => 'quidgets#quidgets_textbox_update', :as => :ph_quidgets_textbox_update
  
  match 'ph_quidgets_dropbox_update' => 'quidgets#quidgets_dropbox_update', :as => :ph_quidgets_dropbox_update
  
  match 'ph_quidgets/quidgets.jquery.js'  => 'support#js_jquery', :as => :ph_quidgets_jquery
end
