DbdApiDocs.helpers do   
  
  def menu_builder(page=nil, menuitems = nil)      
    page = @page if @page               
    menuitems = @menuitems if @menuitems
    if menuitems == nil    
      menu_items = [
          { :name => :docs,     :class => :docs,     :url => "http://#{ENV['DOMAIN']}", :text => 'Docs'}, 
          { :name => :api_docs, :class => :api_docs, :url => '/api',       :text => 'API Docs'},  
        ]                                  
    else
      menu_items = menuitems
    end                              
    content = ""   
    menu_items.each do |item|  
      content << if page == item[:name]
        tag(:li, :content => tag('a',  :content => item[:text], :class => "#{item[:class]}", :href => nil ),  :class => "active #{item[:class]}")   
      else   
        tag(:li, :content => tag('a',  :content => item[:text], :class => "#{item[:class]}", :href => "#{item[:url]}" ), :class => "#{item[:class]}")
      end   
    end
    tag(:ul, :content => content, :class => 'menu')    
  end
end