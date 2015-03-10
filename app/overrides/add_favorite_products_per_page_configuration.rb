Deface::Override.new(
  :virtual_path => 'spree/admin/general_settings/edit',
  :name => 'add_favorite_products_per_page_configuration',
  :insert_after => "#preferences .row:last-of-type",
  :text => %Q{
      <fieldset class="general no-border-top">
        <div class="row">
          <h3><%= Spree.t(:favorites_settings) %></h2>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group" data-hook="admin_favorites_setting_favorite">
              <%= label_tag :favorites_per_page, Spree.t(:favorites_per_page) %><br>
              <%= text_field_tag :favorites_per_page, Spree::Config[:favorites_per_page], class: 'form-control' %>
            </div>
          </div>
        </div>
      </fieldset>
  }
)