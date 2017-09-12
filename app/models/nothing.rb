# require "image_processing/mini_magick"
# require "fastimage"

# class ImageUploader < Shrine
#   include ImageProcessing::MiniMagick

#   plugin :activerecord
#   plugin :determine_mime_type
#   plugin :logging, logger: Rails.logger
#   plugin :remove_attachment
#   plugin :store_dimensions
#   plugin :validation_helpers
#   plugin :cached_attachment_data
#   plugin :determine_mime_type
#   plugin :versions, names: [:original, :large, :medium, :small, :thumb]

#   Attacher.validate do
#     puts get.mime_type # returns empty strings
#     validate_max_size 2.megabytes, message: 'is too large (max is 2 MB)'
#     validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
#   end

#   def process(io, context)
#     if context[:phase] == :store
#       size_700 = resize_to_limit!(io.download, 700, 700)
#       size_500 = resize_to_limit(size_700,    500, 500)
#       size_300 = resize_to_limit(size_500,    300, 300)
#       thumb = resize_to_limit(size_300, 200, 200)

#       { original: io, large: size_700, medium: size_500, small: size_300, thumb: thumb }
#     end
#   end
# end