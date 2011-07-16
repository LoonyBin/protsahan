class <%= class_name %> < <%= parent_class_name.classify %>
  attr_accessible <%= attributes.map { |a| ":#{a.name}" }.join(", ") %>
<% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
  belongs_to :<%= attribute.name %>
<% end -%>
end
