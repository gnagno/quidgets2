module QuidgetsHelper
###################################################################################### checkbox  
# checkbox(record,"active",{:id => "active_check_#{record.id}"})     
  def checkbox(object,method,html_options = {}) 
    
    render :partial => 'templates/checkbox',
            :locals => {
              :html_options       => html_options,
              :is_checked         => object.send(method.to_sym)==true ,
              :object_model_name  => object.class.to_s, 
              :object_id          => object.id,
              :method             => method
            }
  end
###################################################################################### radio
# Role.all.each do |role|
#  html << radio(record,role,{:name => "role_option_#{record.id}"})  
# end

  def radio(object,choice,html_options = {})
    
    render :partial => 'templates/radio',
            :locals => {
              :html_options => html_options,
              :object_model => object.class.to_s,
              :object_id    => object.id,
              :choice_model => choice.class.to_s,
              :choice_id    => choice.id,
              :is_checked   => object.send(choice.class.to_s.underscore.to_sym)==choice
            }
  end
###################################################################################### radio
#  html << radio_group(record,roles,{:name => "role_option_#{record.id}"}) 
  def radio_group(object,choices,html_options = {})
  
    render :partial => 'templates/radio_group',
            :locals =>  {
              :object       =>  object,
              :choices      =>  choices,
              :html_options =>  html_options
            }
  end
###################################################################################### textbox
  def text_box(object,method,html_options = {})
      
    render  :partial => 'templates/textbox', 
            :locals => { 
              :html_options => html_options,
              :value        => object.send(method.to_sym),
              :object_model => object.class.to_s,
              :object_id    => object.id,
              :method       => method
            }
  end
###################################################################################### listbox
#* LISTBOX: listbox(object,choices,html_options = {})
#    <%= listbox(@user,PaymentMethod.all,{:id => "dropbox_#{@user.id}"}) %>        

  def listbox(object,choices,html_options = {})
    
  end
###################################################################################### dropbox
#* DROPBOX: dropbox(object,choices,html_options = {})
# dropbox(user,Role.all,{:id => "role_#{user.id}"})

  def dropbox(object,choices,html_options = {})
    model_name=find_model_name(object)
    html="<select 
      id=\"#{html_options[:id]}\" 
      name=\"#{html_options[:name]}\" 
      class=\"#{html_options[:class]}\" 
      />"
    
    html << "<option onclick=\"#{remote_function(:url => "/application/quidgets_dropbox_update/#{object.id}?model_name=#{model_name}&option_model_name=#{find_model_name(choices.first).underscore}")}\">(Please select)</option>"
      
    choices.each do |choice|
      html << "<option onclick=\"#{remote_function(:url => "/application/quidgets_dropbox_update/#{object.id}?model_name=#{model_name}&option_model_name=#{find_model_name(choice).underscore}&option_id=#{choice.id}")}\"" <<
      "#{"selected" if !object.send(find_model_name(choice).underscore.to_sym).nil? and object.send(find_model_name(choice).downcase.to_sym).id==choice.id} >" << 
      "#{choice.name}</option>"
    end
    html <<"</select>"
    return html
  end
###################################################################################### textbox
  def textbox(object,field,html_options = {})
    render :file => 'views/textbox.html.erb'
  end

######################################################################################  PRIVATE
  private
  def find_model_name(object)
    if object.to_s.match(/<.*:/)
      return $&.gsub(/<|:/,"")
    else
      return nil
    end
  end
###################################################################################### END
end
