# require "shrine"
# require "shrine/storage/file_system"

# uncomment start
# require "shrine/storage/s3"

# s3_options = {
#   access_key_id: 		Rails.application.secrets.aws_access_key_id,
#   secret_access_key: 	Rails.application.secrets.aws_secret_access_key,
#   region: 				Rails.application.secrets.aws_region,
#   bucket: 				Rails.application.secrets.aws_bucket,
#   endpoint: 			Rails.application.secrets.aws_endpoint,
# }

# Shrine.storages = {
# 	cache: Shrine::Storage::S3.new(prefix: "cache", upload_options: {acl: "public-read"}, **s3_options),
# 	store: Shrine::Storage::S3.new(prefix: "store", upload_options: {acl: "public-read"}, **s3_options),
# }

# Shrine.plugin :activerecord
# Shrine.plugin :direct_upload
# Shrine.plugin :restore_cached_data
# Shrine.plugin :cached_attachment_data
# uncomment end

# Shrine.plugin :cached_attachment_data # for forms