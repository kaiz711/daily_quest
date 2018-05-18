CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AWS_Key"],                        # required
    aws_secret_access_key: ENV["AWS_Secret"],                        # required
    region:                'us-east-1',             # optional, defaults to 'us-east-1'
  }
  
  config.fog_directory  = 'dailyquestbucket'            # required
  config.fog_public     = true
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
end