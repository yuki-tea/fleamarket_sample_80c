if Rails.env.development? || Rails.env.test?
  storage :file
else
  storage :fog
end