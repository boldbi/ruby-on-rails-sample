require 'net/http'
require 'uri'
require 'openssl'
require 'json'

class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:token_generation]
  def index
    cfg = GlobalAppSettings.embed_details
    @dashboard_id = cfg["DashboardId"]
    # Build server url including site identifier if present
    server = cfg["ServerUrl"].to_s.chomp('/')
    site = cfg["SiteIdentifier"].to_s
    @server_url = site.empty? ? server : File.join(server, site)
    @site_identifier = site
    # Authorization endpoint previously provided by Api::V1::AuthorizesController
    # Now handled by HomeController#token_generation; no external route required.
  end

  # POST /TokenGeneration
  def token_generation
    cfg = GlobalAppSettings.embed_details

    embed_details = {
      email: cfg["UserEmail"],
      serverurl: cfg["ServerUrl"],
      siteidentifier: cfg["SiteIdentifier"],
      embedsecret: cfg["EmbedSecret"],
      dashboard: {
        id: cfg["DashboardId"]
      }
    }

    request_url = "#{embed_details[:serverurl]}/api/#{embed_details[:siteidentifier]}/embed/authorize"

    uri = URI.parse(request_url)
    http = Net::HTTP.new(uri.host, uri.port)
    if uri.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    req = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
    req.body = embed_details.to_json

    res = http.request(req)

    if res.is_a?(Net::HTTPSuccess)
      begin
        body = JSON.parse(res.body)
        token = body.dig('Data', 'access_token') || body.dig('data', 'access_token') || body['access_token'] || ''
        render plain: token
      rescue StandardError => e
        Rails.logger.error "Failed to parse token response: #{e.message}"
        render plain: res.body, status: :ok
      end
    else
      render plain: res.body, status: res.code.to_i
    end
  end
end
