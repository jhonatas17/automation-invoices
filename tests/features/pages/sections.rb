module Sections
   class NavBar <SitePrism::Section
     element :customer_link, 'a[href$=customers]'
     element :user_menu, 'a[data-toggle=dropdown]'
     element :logout_link, 'a[href$=logout]'
   end
end

