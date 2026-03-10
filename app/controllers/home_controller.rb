class HomeController < ApplicationController
  def index
    cfg = GlobalAppSettings.embed_details
    @dashboard_id = cfg["DashboardId"]
    # Build server url including site identifier if present
    server = cfg["ServerUrl"].to_s.chomp('/')
    site = cfg["SiteIdentifier"].to_s
    @server_url = site.empty? ? server : File.join(server, site)
    @site_identifier = site
    # Authorization endpoint on this Rails app
    @authorization_url = api_v1_authorizes_url
    Rails.logger.info "authorization_url => #{@authorization_url}"
  end
end
