
<% if @application.destroyed? %>
  $('#application_' +<%= @application.id %>).hide();
<% else %>
  $('#application_' +<%= @application.id %>).prepend("<div class='alert alert-danger'><%= flash[:error] %></div>");
<% end %>