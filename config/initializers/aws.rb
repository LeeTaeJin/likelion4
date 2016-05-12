CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJRTLCNZC4BQACWLA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'likelion-ptu'                          # required
  config.fog_public     = true                                      # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end