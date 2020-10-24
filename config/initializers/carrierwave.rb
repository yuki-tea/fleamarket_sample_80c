unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIATRV745DQKALEENM7',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = '80c'
    config.cache_storage = :fog
  end
end