<h1>New Location</h1>
  <% if @location.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@location.errors.count, "error") %> prohibited this location from being saved:</h2>

      <ul>
        <% @location.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
<div class="container">
  <div class="row justify-content-center mt-4 ">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header">Edit Location Details</div>
        <div class="card-body">
          <%= form_with(model: @location, remote: true) do |f| %>
            <div class="form-group">
              <%= f.label :Country%>
              <%= f.text_field :country, class: 'form-control' %>
            </div>
            <div class="form-group">
              <%= f.label :Region %><br/>
              <%= f.select :region_id, Region.all.collect {|x| [x.name, x.id]}, {} %>
            </div>
            <div class="form-group">
              <%= f.submit 'Update Location', class: 'btn btn-primary mt-2' %>
            </div>
          <% end %>
          <div class="card-footer text-muted">
            <%= link_to 'Back', locations_path, class: 'btn btn-secondary' %>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


