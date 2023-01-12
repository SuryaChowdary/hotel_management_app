<div id="edithotel_<%= hotel.id %>" style= "display: none;">
          <%= form_with(model: hotel, data: { remote: true}, method: :post, id: 'editModal' ) do |f| %>
              <div class="form-group">
                <%= f.label :Name %>
                <%= f.text_field :name, class: 'form-control' %>
              </div>
              <div class="form-group">
                <%= f.label :Address %>
                <%= f.text_field :address, class: 'form-control' %>
              </div>
              <div class="form-group">
                <%= f.label :City%>
                <%= f.text_field :city, class: 'form-control' %>
              </div>
              <div class="form-group">
                <%= f.label :State %>
                <%= f.text_field :state, class: 'form-control' %>
              </div>
              <div class="form-group">
                <%= f.label :Location %><br/>
                <%= f.collection_select :location_id, Location.all, :id, :country , class: 'form-control' %>
              </div>
              <div class="form-group">
                <%= f.label :Client %><br/>
                <%= f.select :client_id, Client.all.collect {|x| [x.name, x.id]}, {} %>
              </div>
              <div class="form-group">
                <%= f.label :Phone %>
                <%= f.text_field :phone, class: 'form-control' %>
              </div>
              <div class="form-group">
                <%= f.label :Website %>
                <%= f.text_field :website, class: 'form-control' %>
              </div>
              <div class="form-group">
                <%= f.submit 'Update Hotel', class: 'btn btn-primary' %>
              </div>
            <% end %>
            <div class="card-footer text-muted">
              <%= link_to 'Back', hotel_branches_path, class: 'btn btn-secondary' %>
            </div>
  </div>


<div class="modal fade" id="edithotel-#{hotel.id}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editModalLabel">Edit Hotel</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <%= form_with(model: @hotel, data: { remote: true}, method: :post, id: 'editModal' ) do |f| %>
            <div class="form-group">
              <%= f.label :Name %>
              <%= f.text_field :name, class: 'form-control' %>
            </div>
            <div class="form-group">
              <%= f.label :Address %>
              <%= f.text_field :address, class: 'form-control' %>
            </div>
            <div class="form-group">
              <%= f.label :City%>
              <%= f.text_field :city, class: 'form-control' %>
            </div>
            <div class="form-group">
              <%= f.label :State %>
              <%= f.text_field :state, class: 'form-control' %>
            </div>
            <div class="form-group">
              <%= f.label :Location %><br/>
              <%= f.collection_select :location_id, Location.all, :id, :country , class: 'form-control' %>
            </div>
            <div class="form-group">
              <%= f.label :Client %><br/>
              <%= f.select :client_id, Client.all.collect {|x| [x.name, x.id]}, {} %>
            </div>
            <div class="form-group">
              <%= f.label :Phone %>
              <%= f.text_field :phone, class: 'form-control' %>
            </div>
            <div class="form-group">
              <%= f.label :Website %>
              <%= f.text_field :website, class: 'form-control' %>
            </div>
            <div class="form-group">
              <%= f.submit 'Update Hotel', class: 'btn btn-primary' %>
            </div>
          <% end %>
          <div class="card-footer text-muted">
            <%= link_to 'Back', hotel_branches_path, class: 'btn btn-secondary' %>
          </div>
      </div>
    </div>
  </div>
</div>


