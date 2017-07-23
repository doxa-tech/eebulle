# encoding: utf-8

class ActivitiesUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include CarrierWave::Processing::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fill => [256, 256]
  process :quality => 90

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
