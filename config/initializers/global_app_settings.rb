# Loads embedConfig.json into a global accessor
module GlobalAppSettings
  def self.embed_details
    return @embed_details if defined?(@embed_details) && @embed_details

    path = Rails.root.join("embedConfig.json")
    if File.exist?(path)
      begin
        # Read the file and remove a leading UTF-8 BOM (EF BB BF) if present
        raw = File.read(path)
        raw = raw.sub(/\A\xEF\xBB\xBF/, '')
        @embed_details = JSON.parse(raw)
      rescue StandardError => e
        Rails.logger.error "Failed to parse embedConfig.json: #{e.message}"
        @embed_details = {}
      end
    else
      Rails.logger.warn "embedConfig.json not found at #{path}"
      @embed_details = {}
    end

    @embed_details
  end
end
