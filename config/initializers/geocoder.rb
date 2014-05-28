Geocoder.configure(
  http_proxy: (ENV['QUOTAGUARD_URL'].gsub(/^http:\/\//, '') if ENV['QUOTAGUARD_URL'].present?) || "",
  timeout: 5
) if Rails.env.production?
