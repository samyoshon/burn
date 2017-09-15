CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:    Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key:  Rails.application.secrets.aws_secret_access_key,
    region:         Rails.application.secrets.aws_region,
    endpoint:       Rails.application.secrets.aws_endpoint,
  }
  config.fog_directory  = Rails.application.secrets.aws_bucket                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end