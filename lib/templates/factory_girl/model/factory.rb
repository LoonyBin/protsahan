# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :<%= singular_name %> do

<% for attribute in attributes -%>
  <% if attribute.reference? -%>
    #<%= attribute.name %>
  <% else -%>
    #<%= attribute.name %> <%= attribute.default.inspect %>
  <% end -%>
<% end -%>

  end
end
